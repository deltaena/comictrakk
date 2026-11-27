import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/trackers/models/tracker_merger.dart';

abstract class TrackerState {
  final List<TrackerMerger> mergers;

  TrackerState(this.mergers);
}

class TrackerInitial extends TrackerState {
  TrackerInitial(): super(List.empty());
}

class TrackerLoaded extends TrackerState {
  TrackerLoaded(super.status);
}

class TrackerError extends TrackerState {
  String message;
  TrackerError(this.message): super(List.empty());
}