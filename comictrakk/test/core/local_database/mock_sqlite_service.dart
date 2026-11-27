import 'package:comictrakk/core/enums/tracking_status.dart';
import 'package:comictrakk/core/local_database/models/tracker_row.dart';
import 'package:comictrakk/core/local_database/sqlite_client.dart';
import 'package:comictrakk/core/local_database/subservices/tracker_service.dart';
import 'package:comictrakk/core/models/trackers/trackers.dart';

class MockSqliteService implements SqliteClient {

  bool fail = false;

  @override
  TrackerService get trackerServ => TrackerService();


  @override
  Future<List<TrackerRow>> getAllTrackers() {
    if(fail) throw Exception("simulated exception");

    return Future.value(List.empty());
  }

  @override
  Future<List<TrackerRow>> getTrackers(List<Tracker> trackable) {
    if(fail) throw Exception("simulated exception");

    return Future.value(List.empty());
  }

  @override
  Future<bool> upsertTracker(Tracker trackable) {
    if(fail) throw Exception("simulated exception");

    fail = true;

    return Future.value(true);
  }

  @override
  Future<bool> upsertTrackers(List<Tracker> trackables) {
    if(fail) throw Exception("simulated exception");

    return Future.value(true);
  }

}