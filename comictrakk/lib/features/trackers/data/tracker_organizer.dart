import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/trackers/constants/tracker_status.dart';
import 'package:comictrakk/features/trackers/data/tracker_dao.dart';
import 'package:comictrakk/features/trackers/data/tracker_mapper.dart';
import 'package:comictrakk/features/trackers/models/tracker_operation.dart';
import 'package:comictrakk/features/trackers/models/tracker_organizer_operations.dart';

class TrackerOrganizer {
  final TrackerMapper _mapper = TrackerMapper();
  final List<Tracker> _dbTrackers;

  final TrackerOrganizerOperations _operations = TrackerOrganizerOperations();

  TrackerOrganizer(this._dbTrackers);

  TrackerOrganizerOperations organizeTrackers(List<TrackerOperation> operations) {
    for (TrackerOperation operation in operations) {
      _organizeTracker(operation);
    }

    return _operations;
  }

  void _organizeTracker(TrackerOperation operation) {
    final companion = operation.companion;
    
    bool trackerExists = _companionExists(companion);

    if(operation.operation == .delete){
      if(trackerExists) _operations.delete.add(companion);

      return;
    }

    if(trackerExists){
      _operations.update.add(companion);
      return;
    }

    _collateralActions(companion);
    _operations.insert.add(companion);
  }


  void _collateralActions(TrackersCompanion companion) {
    bool wishAlreadyExists = _trackerExists(companion.issueId.value, .wish);
    bool haveAlreadyExists = _trackerExists(companion.issueId.value, .have);

    bool newStatusIsWish = companion.status.value == TrackerStatus.wish;
    bool newStatusIsHave = companion.status.value == TrackerStatus.have;

    if (newStatusIsHave && wishAlreadyExists) {
      TrackersCompanion deleteWish = _mapper.fromWish(companion.issueId.value);
      _operations.delete.add(deleteWish);
    }

    if (newStatusIsWish && haveAlreadyExists) {
      TrackersCompanion deleteHave = _mapper.fromHave(companion.issueId.value);
      _operations.delete.add(deleteHave);
    }
  }

  bool _companionExists(TrackersCompanion comp) => _trackerExists(comp.issueId.value, comp.status.value);
  bool _trackerExists(int issueId, TrackerStatus status) {
    return _dbTrackers.where((t) => t.issueId == issueId && t.status == status).isNotEmpty;
  }
}
















