import 'package:comictrakk/core/database/app_database.dart';

class TrackerMerger {

  Tracker tracker;
  Issue? parentIssue;

  TrackerMerger({required this.tracker, this.parentIssue});

}