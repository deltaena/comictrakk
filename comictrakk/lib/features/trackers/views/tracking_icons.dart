import 'package:comictrakk/features/trackers/constants/tracker_status.dart';
import 'package:comictrakk/features/trackers/models/tracker_merger.dart';
import 'package:comictrakk/features/trackers/widgets/tracker_status_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrackingIcons extends StatelessWidget {
  final List<TrackerMerger> trackerMergers;

  const TrackingIcons({super.key, required this.trackerMergers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(0, 5, 0, 5),
      child: Column(children: drawIcons()),
    );
  }

  List<Widget> drawIcons() {
    List<Widget> widgets = [];

    if (trackerExists(.wish)) widgets.add(WishIcon());
    if (trackerExists(.have)) widgets.add(HaveIcon());
    if (trackerExists(.read)) widgets.add(ReadIcon());

    if (widgets.isEmpty) widgets.add(DefaultIcon());

    return widgets;
  }

  bool trackerExists(TrackerStatus status) {
    return trackerMergers
        .where((merger) => merger.tracker.status == status)
        .isNotEmpty;
  }
}
