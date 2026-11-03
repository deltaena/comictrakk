import 'dart:async';
import 'dart:collection';

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

  Future<List<Object?>> upsertTrackers(List<Trackable> trackables, TrackStatus newStatus) async {
    List<Map<String, Object?>> trackerRowsList =  await _trackerServ.getTrackers(trackables);
    List<int> rowIds = trackerRowsList.map((trackerRow) => int.parse(trackerRow["id"].toString())).toList();

    List<Trackable> trackablesInsert = List.empty(growable: true);
    List<Trackable> trackablesUpdate = List.empty(growable: true);
    List<Trackable> trackablesDelete = List.empty(growable: true);

    for(Trackable trackable in trackables){
      if(rowIds.contains(trackable.id)) {
        if(trackable.getTrackStatus().value == newStatus.value){
          print("deltalog: delete -> ${trackable.id}");
          trackablesDelete.add(trackable);
        } else {
          print("deltalog: update -> ${trackable.id}");
          trackablesUpdate.add(trackable);
        }
      } else {
        print("deltalog: insert -> ${trackable.id}");
        trackablesInsert.add(trackable);
      }
    }

    List<Object?> insertResult = await _trackerServ.insertTrackers(trackablesInsert, newStatus);
    List<Object?> updateResult = await _trackerServ.updateTrackers(trackablesUpdate, newStatus);
    List<Object?> deleteResult = await _trackerServ.deleteTrackers(trackablesUpdate);


    List<Object?> results = List.from(insertResult);

    results.addAll(updateResult);
    results.addAll(deleteResult);

    return results;
  }
  Future<bool> upsertTracker(Trackable trackable, TrackStatus newStatus) async {
    List<Map<String, Object?>> getTrackerResult = await _trackerServ.getTracker(trackable);
    bool trackerMissing = getTrackerResult.isEmpty;

    if(trackerMissing) {
      int insertedRowId = await _trackerServ.insertTracker(trackable, newStatus);

      return insertedRowId > 0;
    }

    bool statusMatches = trackable.getTrackStatus().value == newStatus.value;

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














































