import 'package:comictrakk/objects/trackable/trackable.dart';
import 'package:comictrakk/objects/enum_variables/track_status.dart';
import 'package:comictrakk/services/storage/sqlite_subservice.dart';
import 'package:sqflite/sqflite.dart';

class TrackerSubservice extends SqliteSubservice {

  @override
  String get dbName => "tracker";

  @override
  String get dbCreateQuery => "CREATE TABLE tracker (id INTEGER PRIMARY KEY, status INTEGER)";


  Future<int> insertTracker(Trackable trackable, TrackStatus newStatus) async {
    return await _insertTracker(_createArgs(trackable, newStatus));
  }

  Future<int> updateTracker(Trackable trackable, TrackStatus newStatus) async {
    return await _updateTracker(_createArgs(trackable, newStatus));
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
  Future<int> _insertTracker(Map<String, dynamic> map) async {
    Database db = await open();

    return await db.insert(
        dbName,
        map,
        conflictAlgorithm: ConflictAlgorithm.fail
    );
  }

  Future<int> _updateTracker(Map<String, dynamic> map) async {
    Database db = await open();

    return await db.update(
        "tracker",
        map,
        where: "id = ?",
        whereArgs: [map["id"]],
        conflictAlgorithm: ConflictAlgorithm.fail
    );
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
        where: "id = ?",
        whereArgs: [trackableId]
    );
  }
  //endregion
}

























