import 'dart:async';

import 'package:comictrakk/objects/Trackable/trackable.dart';
import 'package:comictrakk/objects/enum_variables/track_status.dart';
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

  Future<Map<String, dynamic>> getTracker(Trackable trackable) async {
    print("deltalog: querying id ${trackable.id}");

    List<Map<String, Object?>> result = await _queryTracker(trackable.id);

    print("deltalog: ${result.length} rows");

    print("deltalog: $result");

    if(result.length == 1){
      return result[0];
    }

    throw Exception("more than one row was queried, something failed");
  }

  Future<bool> updateTracker(Trackable trackable, TrackStatus newStatus) async {
    print("deltalog: updating id ${trackable.id}");

    bool trackerCreated = await trackerExists(trackable);

    Map<String, dynamic> row = { "id": trackable.id, "status": newStatus.value };

    if(trackerCreated){
      return await _updateTracker(trackable.id, row);
    }

    return await _insertTracker(row);
  }

  Future<bool> trackerExists(Trackable trackable) async {
    List<Map<String, Object?>> trackers = await _queryTracker(trackable.id);

    return trackers.isNotEmpty;
  }

  Future<List<Map<String, Object?>>> _queryTracker(int trackableId) async {
    Database db = await _open();

    List<Map<String, Object?>> result = await db.query(
        "tracker",
        where: "id = ?",
        whereArgs: [trackableId]
    );

    return result;
  }

  Future<bool> _insertTracker(Map<String, dynamic> map) async {
    Database db = await _open();

    int rowId = await db.insert(
        "tracker",
        map,
        conflictAlgorithm: ConflictAlgorithm.fail
    );

    return rowId > 0;
  }

  Future<bool> _updateTracker(int trackableId, Map<String, dynamic> map) async {
    Database db = await _open();

    int rowId = await db.update(
        "tracker",
        map,
        where: "id = ?",
        whereArgs: [trackableId],
        conflictAlgorithm: ConflictAlgorithm.fail
    );

    return rowId > 0;
  }

  Future<Database> _open() async {
    WidgetsFlutterBinding.ensureInitialized();

    return openDatabase(
      join(await getDatabasesPath(), 'comictrakk.db'),

      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tracker(id INTEGER PRIMARY KEY, status INTEGER)',
        );
      },
      version: 1,
    );
  }
}