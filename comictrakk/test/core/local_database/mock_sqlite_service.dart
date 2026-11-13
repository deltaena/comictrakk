import 'package:comictrakk/core/enums/comic_tracking_status.dart';
import 'package:comictrakk/core/local_database/models/tracker_row.dart';
import 'package:comictrakk/core/local_database/sqlite_service.dart';
import 'package:comictrakk/core/local_database/subservices/tracker_subservice.dart';
import 'package:comictrakk/core/models/trackable/trackable.dart';

class MockSqliteService implements SqliteService {

  bool fail = false;

  @override
  TrackerSubservice get trackerServ => TrackerSubservice();


  @override
  Future<List<TrackerRow>> getAllTrackers() {
    if(fail) throw Exception("simulated exception");

    return Future.value(List.empty());
  }

  @override
  Future<List<TrackerRow>> getTrackers(List<Trackable> trackable) {
    if(fail) throw Exception("simulated exception");

    return Future.value(List.empty());
  }

  @override
  Future<bool> upsertTracker(Trackable trackable, ComicTrackingStatus newStatus) {
    if(fail) throw Exception("simulated exception");

    fail = true;

    return Future.value(true);
  }

  @override
  Future<bool> upsertTrackers(List<Trackable> trackables, ComicTrackingStatus newStatus) {
    if(fail) throw Exception("simulated exception");

    return Future.value(true);
  }

}