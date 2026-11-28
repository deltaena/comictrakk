import 'package:comictrakk/features/trackers/constants/tracker_status.dart';
import 'package:comictrakk/features/trackers/models/tracker_merger.dart';
import 'package:comictrakk/features/trackers/widgets/tracker_status_icons.dart';
import 'package:flutter/cupertino.dart';

class TrackingResume extends StatelessWidget {
  final List<TrackerMerger> _allTrackers;

  int _wishCount() => _statusCount(.wish);
  int _haveCount() => _statusCount(.have);
  int _readCount() => _statusCount(.read);

  int _statusCount(TrackerStatus status) => _allTrackers.where((tracker) => tracker.tracker.status == status).length;

  const TrackingResume(this._allTrackers, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Column(children: [WishIcon(), Text("${_wishCount()}")])),
        Expanded(child: Column(children: [HaveIcon(), Text("${_haveCount()}")])),
        Expanded(child: Column(children: [ReadIcon(), Text("${_readCount()}")])),
      ],
    );
  }
}
