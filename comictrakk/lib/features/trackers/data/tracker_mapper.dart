import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/trackers/constants/operation.dart';
import 'package:comictrakk/features/trackers/constants/tracker_status.dart';
import 'package:comictrakk/features/trackers/models/tracker_operation.dart';
import 'package:drift/drift.dart';

class TrackerMapper {
  TrackerOperation fromNewStatus(Issue issue, TrackerStatus newStatus, Operation operation, [int? parentIssueId]) {
    final companion = TrackersCompanion.insert(
      issueId: issue.id,
      parentIssueId: Value(parentIssueId),
      status: newStatus,
    );
    
    return TrackerOperation(companion: companion, operation: operation);
  }

  TrackerOperation fromParentCompanion(TrackerOperation parent, Reprint reprint){
    final companion =  TrackersCompanion.insert(
      issueId: reprint.issueId,
      parentIssueId: parent.companion.issueId,
      status: parent.companion.status.value,
    );
    
    return TrackerOperation(companion: companion, operation: parent.operation);
  }

  TrackersCompanion fromWish(int issueId){
    return TrackersCompanion.insert(
      issueId: issueId,
      status: TrackerStatus.wish,
    );
  }

  TrackersCompanion fromHave(int issueId){
    return TrackersCompanion.insert(
      issueId: issueId,
      status: TrackerStatus.have,
    );
  }
}
