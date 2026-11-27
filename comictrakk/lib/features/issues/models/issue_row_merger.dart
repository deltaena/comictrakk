import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/trackers/models/tracker_merger.dart';

class IssueRowMerger {
  final Issue issue;
  final IssueDetail? details;
  final TrackerMerger? tracker;

  bool get hasDetails => details != null;

  IssueRowMerger({required this.issue, this.details, this.tracker});
}
