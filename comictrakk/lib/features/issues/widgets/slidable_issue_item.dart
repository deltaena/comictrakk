import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/trackers/models/tracker_merger.dart';
import 'package:comictrakk/features/trackers/widgets/tracker_slidable_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'issue_listview_item.dart';

class SlidableIssueItem extends StatelessWidget {
  final Issue _issue;

  final List<TrackerMerger> _trackerMergers;

  final Function onStatusSelected;

  const SlidableIssueItem({super.key, required this._issue, required this._trackerMergers, required this.onStatusSelected});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),

      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          WishAction(onStatusSelected: onStatusSelected),
          HaveAction(onStatusSelected: onStatusSelected),
          ReadAction(onStatusSelected: onStatusSelected)
        ],
      ),

      child: IssueListViewItem(issue: _issue, trackerMergers: _trackerMergers),
    );
  }
}
