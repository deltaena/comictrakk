import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/trackers/constants/tracker_status.dart';
import 'package:comictrakk/features/trackers/models/tracker_merger.dart';
import 'package:comictrakk/features/trackers/views/tracking_icons.dart';
import 'package:flutter/material.dart';

class IssueListViewItem extends StatelessWidget {
  final Issue _issue;
  final List<TrackerMerger> _trackerMergers;

  const IssueListViewItem({
    super.key,
    required this._issue,
    required this._trackerMergers,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Expanded(flex: 1, child: TrackingIcons(trackerMergers: _trackerMergers)),
          Expanded(flex: 3, child: IssueCover(issue: _issue)),
          Expanded(flex: 12, child: IssueBody(issue: _issue, trackerMergers: _trackerMergers)),
        ],
      ),
    );
  }
}

class IssueCover extends StatelessWidget {
  final Issue _issue;

  const IssueCover({super.key, required this._issue});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      _issue.imageUrl.toString(),
      fit: BoxFit.contain,
    );
  }
}

class IssueBody extends StatelessWidget {
  final Issue _issue;
  final List<TrackerMerger> _trackerMergers;
  TrackerMerger get biggerTracker => _trackerMergers.reduce((prev, next) => (prev.tracker.status.value > next.tracker.status.value) ? prev : next);

  const IssueBody({super.key, required this._issue, required this._trackerMergers});

  @override
  Widget build(BuildContext context) {
    String infoString = "";

    if(_trackerMergers.isNotEmpty) {
      infoString += biggerTracker.tracker.status.name;

      if(biggerTracker.parentIssue != null) {
        infoString += " in ${biggerTracker.parentIssue!.name}";
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("#${_issue.number}: ${_issue.name}"),
        Text(infoString),
      ],
    );
  }
}
