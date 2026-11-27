import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/trackers/models/tracker_merger.dart';

class IssueMerger {
  final Issue issue;
  final IssueDetail? details;
  final List<TrackerMerger> trackerMergers = [];

  bool get hasDetails => details != null;

  IssueMerger({required this.issue, this.details});

  void addTracker(TrackerMerger tracker) => trackerMergers.add(tracker);

}
