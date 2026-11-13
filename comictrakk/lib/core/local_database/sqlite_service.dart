import 'dart:async';
import 'dart:collection';

import 'package:comictrakk/core/models/series/series_snippet.dart';
import 'package:comictrakk/core/models/trackable/trackable.dart';
import 'package:comictrakk/core/enums/comic_tracking_status.dart';
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

  final TrackerSubservice trackerServ = TrackerSubservice();
  
  Future<bool> upsertTrackers(List<Trackable> trackables, ComicTrackingStatus newStatus) async {
    List<Map<String, Object?>> trackerRowsList =  await trackerServ.getTrackers(trackables);

    Map<int, TrackerRow> rowMap = { for (Map<String, Object?> row in trackerRowsList) int.parse(row["id"]!.toString()) : TrackerRow.fromJson(row) };

    List<Trackable> toInsert = List.empty(growable: true);
    List<Trackable> toUpdate = List.empty(growable: true);
    List<Trackable> toDelete = List.empty(growable: true);


    for(Trackable trackable in trackables) {
      bool isInDb = rowMap.containsKey(trackable.id);

      if(isInDb) trackable.setComicStatus(ComicTrackingStatus.fromInt(rowMap[trackable.id]!.status));

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

    await trackerServ.insertTrackers(toInsert, newStatus);
    await trackerServ.updateTrackers(toUpdate, newStatus);
    await trackerServ.deleteTrackers(toDelete);

    return true;
  }
  Future<bool> upsertTracker(Trackable trackable, ComicTrackingStatus newStatus) async {
    List<Map<String, Object?>> getTrackerResult = await trackerServ.getTracker(trackable);
    bool trackerMissing = getTrackerResult.isEmpty;

    //if tracker is not in db: if tracker is 0 ignore, else insert in db
    if(trackerMissing) {
      if(newStatus.value == 0){
        return true;
      }

      int insertedRowId = await trackerServ.insertTracker(trackable, newStatus);
      return insertedRowId == trackable.id;
    }

    bool statusMatches = trackable.getComicStatus().value == newStatus.value;

    //tracker is in db: if new status is same that already has or new status is not tracking delete
    if(statusMatches || newStatus.value == 0){
      int deletedRows = await trackerServ.deleteTracker(trackable);

      return deletedRows == 1;
    }

    //tracker is in db and is new status is different than not tracking and different from current
    int updatedRows = await trackerServ.updateTracker(trackable, newStatus);

    return updatedRows == 1;
  }

  Future<List<TrackerRow>> getAllTrackers() async {
    List<Map<String, Object?>> rows = await trackerServ.getAllTrackers();

    return rows.map((row) => TrackerRow.fromJson(row)).toList();
  }
  Future<List<TrackerRow>> getTrackers(List<Trackable> trackable) async {
    List<Map<String, Object?>> rows = await trackerServ.getTrackers(trackable);

    return rows.map((row) => TrackerRow.fromJson(row)).toList();
  }
}














































