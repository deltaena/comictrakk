import 'dart:async';

import 'package:comictrakk/objects/trackable/trackable.dart';
import 'package:comictrakk/objects/enum_variables/track_status.dart';
import 'package:comictrakk/objects/sqlite_rows/tracker_row.dart';
import 'package:comictrakk/services/storage/tracker_subservice.dart';
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

  Future<bool> upsertTracker(Trackable trackable, TrackStatus newStatus) async {
    List<Map<String, Object?>> getTrackerResult = await _trackerServ.getTracker(trackable);
    bool trackerMissing = getTrackerResult.isEmpty;

    if(trackerMissing) {
      int insertedRowId = await _trackerServ.insertTracker(trackable, newStatus);

      return insertedRowId > 0;
    }

    bool statusMatches = trackable.getTrackStatus().name == newStatus.name;

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














































