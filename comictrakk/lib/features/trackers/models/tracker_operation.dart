import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/trackers/constants/operation.dart';
import 'package:comictrakk/features/trackers/constants/tracker_status.dart';

class TrackerOperation {
  
  TrackersCompanion companion;
  Operation operation;
  
  TrackerOperation({required this.companion, required this.operation});
  
}