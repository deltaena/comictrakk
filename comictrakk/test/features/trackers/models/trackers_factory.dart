import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/trackers/constants/operation.dart';
import 'package:comictrakk/features/trackers/constants/tracker_status.dart';
import 'package:comictrakk/features/trackers/models/tracker_operation.dart';
import 'package:drift/drift.dart';

class TrackersFactory {

  List<Tracker> rainbow(){
    List<Tracker> trackers = List.empty(growable: true);

    trackers.add(Tracker(issueId: 1, status: .have));

    return trackers;
  }

  Tracker singleWish() => createSingle(1, .wish);
  Tracker singleHave() => createSingle(1, .have);
  Tracker singleRead() => createSingle(1, .read);

  Tracker createSingle(int id, TrackerStatus status){
    return Tracker(issueId: id, status: status);
  }

  TrackerOperation singleWishComp(Operation operation) => createSingleComp(1, .wish, operation);
  TrackerOperation singleHaveComp(Operation operation) => createSingleComp(1, .have, operation);
  TrackerOperation singleReadComp(Operation operation) => createSingleComp(1, .read, operation);

  TrackerOperation createSingleComp(int id, TrackerStatus status, Operation operation, [parentId]){
    final companion =  TrackersCompanion(issueId: Value(id), parentIssueId: Value(parentId), status: Value(status));

    return TrackerOperation(companion: companion, operation: operation);
  }

  TrackersCompanion createSingleCompWithParent(int id, TrackerStatus status, int parentId){
    return TrackersCompanion(issueId: Value(id), parentIssueId: Value(parentId), status: Value(status));
  }
}