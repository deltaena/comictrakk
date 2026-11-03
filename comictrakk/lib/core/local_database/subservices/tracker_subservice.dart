import 'package:comictrakk/core/models/trackable/trackable.dart';
import 'package:comictrakk/core/enums/track_status.dart';
import 'package:comictrakk/core/local_database/subservices/sqlite_subservice.dart';
import 'package:sqflite/sqflite.dart';

class TrackerSubservice extends SqliteSubservice {

  @override
  String get dbName => "tracker";

  @override
  String get dbCreateQuery => "CREATE TABLE tracker (id INTEGER PRIMARY KEY, status INTEGER)";


  Future<List<Object?>> insertTrackers(List<Trackable> trackables, TrackStatus newStatus) async {
    List<Map<String, dynamic>> trackablesMap = trackables.map((trackable) => _createArgs(trackable, newStatus)).toList();

    return await _insertTrackers(trackablesMap);
  }
  Future<int> insertTracker(Trackable trackable, TrackStatus newStatus) async {
    return await _insertTracker(_createArgs(trackable, newStatus));
  }

  Future<List<Object?>> updateTrackers(List<Trackable> trackables, TrackStatus newStatus) async {
    List<Map<String, dynamic>> trackablesMap = trackables.map((trackable) => _createArgs(trackable, newStatus)).toList();

    return await _updateTrackers(trackablesMap);
  }
  Future<int> updateTracker(Trackable trackable, TrackStatus newStatus) async {
    return await _updateTracker(_createArgs(trackable, newStatus));
  }

  Future<List<Object?>> deleteTrackers(List<Trackable> trackables) async {
    List<int> trackableIds = trackables.map((trackable) => trackable.id).toList();

    return await _deleteTrackers(trackableIds);
  }
  Future<int> deleteTracker(Trackable trackable) async {
    return await _deleteTracker(trackable.id);
  }

  Future<List<Map<String, Object?>>> getTrackers(List<Trackable> trackables) async {
    return await _getTrackers(trackables.map((trackable) => trackable.id).toList());
  }
  Future<List<Map<String, Object?>>> getTracker(Trackable trackable) async {
    return await _getTracker(trackable.id);
  }


  Map<String, dynamic> _createArgs(Trackable trackable, TrackStatus newStatus) {
    return { "id": trackable.id, "status": newStatus.value};
  }



  //region insert, update, delete get logic
  Future<List<Object?>> _insertTrackers(List<Map<String, dynamic>> trackables) async {
    Batch batch = await openBatch();

    for(Map<String, dynamic> trackableMap in trackables){
      batch.insert(
          dbName,
          trackableMap,
      );
    }

    return await batch.commit();
  }
  Future<int> _insertTracker(Map<String, dynamic> map) async {
    Database db = await open();

    return await db.insert(
        dbName,
        map,
        conflictAlgorithm: ConflictAlgorithm.fail
    );
  }

  Future<List<Object?>> _updateTrackers(List<Map<String, dynamic>> trackables) async {
    Batch batch = await openBatch();

    for(Map<String, dynamic> trackableMap in trackables){
      batch.update(
        dbName,
        trackableMap,
        where: "id = ?",
        whereArgs: [trackableMap["id"]]
      );
    }

    return await batch.commit();
  }
  Future<int> _updateTracker(Map<String, dynamic> map) async {
    Database db = await open();

    return await db.update(
        dbName,
        map,
        where: "id = ?",
        whereArgs: [map["id"]],
        conflictAlgorithm: ConflictAlgorithm.fail
    );
  }

  Future<List<Object?>> _deleteTrackers(List<int> trackableIds) async {
    Batch batch = await openBatch();

    String placeholders = List.filled(trackableIds.length, "?").join(",");

    batch.delete(
      dbName,
      where: "id IN ($placeholders)",
      whereArgs: trackableIds,
    );

    return await batch.commit();
  }
  Future<int> _deleteTracker(int trackableId) async {
    Database db = await open();

    return await db.delete(
      dbName,
      where: "id = ?",
      whereArgs: [trackableId],
    );
  }

  Future<List<Map<String, Object?>>> _getTrackers(List<int> trackableIds) async {
    Database db = await open();

    String placeholders = List.filled(trackableIds.length, "?").join(",");

    return await db.query(
        dbName,
        where: "id IN ($placeholders)",
        whereArgs: trackableIds
    );
  }
  Future<List<Map<String, Object?>>> _getTracker(int trackableId) async {
    Database db = await open();

    return await db.query(
        dbName,
        limit: 1,
        where: "id = ?",
        whereArgs: [trackableId]
    );
  }
  //endregion
}

























