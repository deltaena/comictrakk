import 'dart:async';
import 'dart:collection';

import 'package:comictrakk/core/models/series/series_snippet.dart';
import 'package:comictrakk/core/models/trackable/trackable.dart';
import 'package:comictrakk/core/enums/track_status.dart';
import 'package:comictrakk/core/local_database/models/tracker_row.dart';
import 'package:comictrakk/core/local_database/subservices/tracker_subservice.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteService {

  //region singleton
  static final SqliteService _singleton = SqliteService._internal();

  factory SqliteService() {
    return _singleton;
  }

  SqliteService._internal();
  //endregion

  final TrackerSubservice _trackerServ = TrackerSubservice();

  Future<List<Object?>> upsertTrackers(List<Trackable> trackables, ComicStatus newStatus) async {
    List<Map<String, Object?>> trackerRowsList =  await _trackerServ.getTrackers(trackables);
    Map<int, TrackerRow> rowMap = { for (Map<String, Object?> row in trackerRowsList) int.parse(row["id"]!.toString()) : TrackerRow.fromJson(row) };

    List<Trackable> toInsert = List.empty(growable: true);
    List<Trackable> toUpdate = List.empty(growable: true);
    List<Trackable> toDelete = List.empty(growable: true);

    for(Trackable trackable in trackables) {
      bool isInDb = rowMap.containsKey(trackable.id);

      if(isInDb) trackable.setComicStatus(ComicStatus.fromInt(rowMap[trackable.id]!.status));

      bool sameStatus = trackable.getComicStatus().value == newStatus.value;

      //if status doesn't change skip
      if(sameStatus) continue;

      //if want to delete and is not in db skip
      if(newStatus.value == 0 && isInDb){
        toDelete.add(trackable);
        continue;
      }

      if(isInDb) {
        toUpdate.add(trackable);
        continue;
      }

      toInsert.add(trackable);
    }

    List<Object?> insertResult = await _trackerServ.insertTrackers(toInsert, newStatus);
    List<Object?> updateResult = await _trackerServ.updateTrackers(toUpdate, newStatus);
    List<Object?> deleteResult = await _trackerServ.deleteTrackers(toDelete);

    List<Object?> results = List.from(insertResult);

    results.addAll(updateResult);
    results.addAll(deleteResult);

    return results;
  }

  Future<bool> upsertTracker(Trackable trackable, ComicStatus newStatus) async {
    List<Map<String, Object?>> getTrackerResult = await _trackerServ.getTracker(trackable);
    bool trackerMissing = getTrackerResult.isEmpty;

    if(trackerMissing) {
      int insertedRowId = await _trackerServ.insertTracker(trackable, newStatus);

      return insertedRowId > 0;
    }

    bool statusMatches = trackable.getComicStatus().value == newStatus.value;

    if(statusMatches){
      int deletedRows = await _trackerServ.deleteTracker(trackable);

      return deletedRows == 1;
    }

    int updatedRows = await _trackerServ.updateTracker(trackable, newStatus);

    return updatedRows == 1;
  }

  Future<List<TrackerRow>> getTrackers(List<Trackable> trackable) async {
    List<Map<String, Object?>> rows = await _trackerServ.getTrackers(trackable);

    return rows.map((row) => TrackerRow.fromJson(row)).toList();
  }
  Future<List<TrackerRow>> getTracker(Trackable trackable) async {
    List<Map<String, Object?>> rows = await _trackerServ.getTracker(trackable);

    return rows.map((row) => TrackerRow.fromJson(row)).toList();
  }

}














































