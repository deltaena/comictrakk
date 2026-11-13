import 'package:comictrakk/core/models/trackable/trackable.dart';
import 'package:comictrakk/core/enums/comic_tracking_status.dart';
import 'package:comictrakk/core/local_database/subservices/sqlite_subservice.dart';
import 'package:sqflite/sqflite.dart';

class TrackerSubservice extends SqliteSubservice {

  @override
  String get tableName => "tracker";

  @override
  String get tableCreateQuery => '''
    CREATE TABLE tracker (
      id INTEGER PRIMARY KEY, 
      status INTEGER,
      check(status >= 0 AND status <= 3)
    )
  ''';

  @override
  int get version => 2;

  //region insert exposed methods
  Future<List<Object?>> insertTrackers(List<Trackable> trackables, ComicTrackingStatus newStatus) async {
    List<Map<String, dynamic>> trackablesMap = trackables.map((trackable) => _createArgs(trackable, newStatus)).toList();

    return await _insertTrackers(trackablesMap);
  }
  Future<int> insertTracker(Trackable trackable, ComicTrackingStatus newStatus) async {
    return await _insertTracker(_createArgs(trackable, newStatus));
  }
  //endregion

  //region update exposed methods
  Future<List<Object?>> updateTrackers(List<Trackable> trackables, ComicTrackingStatus newStatus) async {
    List<Map<String, dynamic>> trackablesMap = trackables.map((trackable) => _createArgs(trackable, newStatus)).toList();

    return await _updateTrackers(trackablesMap);
  }
  Future<int> updateTracker(Trackable trackable, ComicTrackingStatus newStatus) async {
    return await _updateTracker(_createArgs(trackable, newStatus));
  }
  //endregion

  //region delete exposed methods
  Future<bool> deleteAllTrackers() async {
    return await _deleteAllTracker();
  }
  Future<int> deleteTrackers(List<Trackable> trackables) async {
    List<int> trackableIds = trackables.map((trackable) => trackable.id).toList();

    return await _deleteTrackers(trackableIds);
  }
  Future<int> deleteTracker(Trackable trackable) async {
    return await _deleteTracker(trackable.id);
  }
  //endregion

  //region get exposed methods
  Future<List<Map<String, Object?>>> getAllTrackers() async {
    return await _getTrackers();
  }
  Future<List<Map<String, Object?>>> getTrackers(List<Trackable> trackables) async {
    return await _getTrackersById(trackables.map((trackable) => trackable.id).toList());
  }
  Future<List<Map<String, Object?>>> getTracker(Trackable trackable) async {
    return await _getTrackerById(trackable.id);
  }
  //endregion

  Map<String, dynamic> _createArgs(Trackable trackable, ComicTrackingStatus newStatus) {
    return { "id": trackable.id, "status": newStatus.value};
  }


  //region insert, update, delete get logic
  Future<List<Object?>> _insertTrackers(List<Map<String, dynamic>> trackables) async {
    Batch batch = await openBatch();

    for(Map<String, dynamic> trackableMap in trackables){
      batch.insert(
          tableName,
          trackableMap,
      );
    }

    return await batch.commit();
  }
  Future<int> _insertTracker(Map<String, dynamic> map) async {
    Database db = await open();

    return await db.insert(
        tableName,
        map,
        conflictAlgorithm: ConflictAlgorithm.fail
    );
  }

  Future<List<Object?>> _updateTrackers(List<Map<String, dynamic>> trackables) async {
    Batch batch = await openBatch();

    for(Map<String, dynamic> trackableMap in trackables){
      batch.update(
        tableName,
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
        tableName,
        map,
        where: "id = ?",
        whereArgs: [map["id"]],
        conflictAlgorithm: ConflictAlgorithm.fail
    );
  }

  Future<bool> _deleteAllTracker() async {
    Database db = await open();

    await db.delete(tableName);

    List<dynamic> rows = await getAllTrackers();

    return rows.isEmpty;
  }
  Future<int> _deleteTrackers(List<int> trackableIds) async {
    Database db = await open();

    String placeholders = List.filled(trackableIds.length, "?").join(",");

    return await db.delete(
      tableName,
      where: "id IN ($placeholders)",
      whereArgs: trackableIds,
    );
  }
  Future<int> _deleteTracker(int trackableId) async {
    Database db = await open();

    return await db.delete(
      tableName,
      where: "id = ?",
      whereArgs: [trackableId],
    );
  }

  Future<List<Map<String, Object?>>> _getTrackers() async {
    Database db = await open();

    return await db.query(tableName);
  }
  Future<List<Map<String, Object?>>> _getTrackersById(List<int> trackableIds) async {
    Database db = await open();

    String placeholders = List.filled(trackableIds.length, "?").join(",");

    return await db.query(
        tableName,
        where: "id IN ($placeholders)",
        whereArgs: trackableIds
    );
  }
  Future<List<Map<String, Object?>>> _getTrackerById(int trackableId) async {
    Database db = await open();

    return await db.query(
        tableName,
        limit: 1,
        where: "id = ?",
        whereArgs: [trackableId]
    );
  }
  //endregion
}

























