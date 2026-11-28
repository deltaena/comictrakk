import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/trackers/constants/tracker_status.dart';
import 'package:comictrakk/features/trackers/data/tracker_dao.dart';
import 'package:comictrakk/features/trackers/data/tracker_mapper.dart';
import 'package:comictrakk/features/trackers/data/tracker_organizer.dart';
import 'package:comictrakk/features/trackers/models/tracker_operation.dart';
import 'package:comictrakk/features/trackers/models/tracker_merger.dart';
import 'package:comictrakk/features/trackers/models/tracker_organizer_operations.dart';

class TrackerRepository {
  final TrackerDao _dao;
  final TrackerMapper _mapper = TrackerMapper();

  new(this._dao);

  Future<List<Tracker>> getAllTrackers() async => _dao.getAllTrackers();
  Future<bool> trackerExists(int issueId, TrackerStatus status) async => _dao.trackerExists(issueId, status);

  Stream<List<TrackerMerger>> watchAllTrackers() => _dao.watchAllTrackers();
  Stream<List<TrackerMerger>> watchTrackersBySeries(int seriesId) =>
      _dao.watchTrackersBySeries(seriesId);

  Future<List<Tracker>> getIssueTracker(int issueId) async => await _dao.getIssueTrackers(issueId);

  Future<void> upsertTracker(TrackerOperation operation, List<Reprint> reprints) async {
    final companions = reprints.map((reprint) => _mapper.fromParentCompanion(operation, reprint)).toList();
    companions.add(operation);

    final foundTrackers = await _dao.getTrackersInIssues(companions.map((i) => i.companion.issueId.value));

    final organizer = TrackerOrganizer(foundTrackers);

    final operations = organizer.organizeTrackers(companions);

    _executeOperations(operations);
  }


  void _executeOperations(TrackerOrganizerOperations operations){
    if(operations.insert.isNotEmpty){
      if(operations.insert.length == 1){
        _dao.insertTracker(operations.insert[0]);
      } else {
        _dao.insertMultiple(operations.insert);
      }
    }

    if(operations.update.isNotEmpty){
      if(operations.update.length == 1){
        _dao.updateTracker(operations.update[0]);
      } else {
        _dao.updateMultiple(operations.update);
      }
    }

    if(operations.delete.isNotEmpty){
      if(operations.delete.length == 1){
        _dao.deleteTracker(operations.delete[0]);
      } else {
        _dao.deleteMultiple(operations.delete);
      }
    }
  }
}
