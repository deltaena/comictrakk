import 'package:collection/collection.dart';
import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/core/widgets/custom_separator.dart';
import 'package:comictrakk/core/widgets/dialog_manager.dart';
import 'package:comictrakk/features/issues/models/issue_merger.dart';
import 'package:comictrakk/features/issues/widgets/issue_listview_item.dart';
import 'package:comictrakk/features/issues/widgets/slidable_issue_item.dart';
import 'package:comictrakk/features/series/models/series_extension.dart';
import 'package:comictrakk/features/trackers/constants/tracker_status.dart';
import 'package:comictrakk/features/trackers/cubit/tracker_cubit.dart';
import 'package:comictrakk/features/trackers/cubit/tracker_state.dart';
import 'package:comictrakk/features/trackers/models/tracker_merger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IssueListview extends StatelessWidget {
  final Series _series;
  final List<IssueMerger> _mergers;

  const IssueListview({
    super.key,
    required this._series,
    required this._mergers,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      itemCount: _mergers.length,
      itemBuilder: (BuildContext context, int index) => IssuesBlocSelector(series: _series, merger: _mergers[index]),
      separatorBuilder: (BuildContext context, int index) => CustomSeparator(),
    );
  }
}

class IssuesBlocSelector extends StatelessWidget {
  final Series _series;
  final IssueMerger _merger;

  const IssuesBlocSelector({
    super.key,
    required this._series,
    required this._merger,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TrackerCubit, TrackerState, List<TrackerMerger>>(
      selector: (state) {
        List<Tracker> newTrackers = state.mergers
            .map((merger) => merger.tracker)
            .where((tracker) => tracker.issueId == _merger.issue.id)
            .toList();

        List<int> newValues = newTrackers
            .map((tracker) => tracker.status.value)
            .toList();

        List<int> oldValues = _merger.trackerMergers
            .map((merger) => merger.tracker.status.value)
            .toList();

        bool sameTrackers = ListEquality().equals(newValues, oldValues);

        return (sameTrackers) ? _merger.trackerMergers : state.mergers;
      },
      builder: (context, trackerMergers) => SlidableIssueItem(
          issue: _merger.issue,
          trackerMergers: trackerMergers,
          onStatusSelected: (TrackerStatus selectedStatus) async {
            bool propagate = false;

            if (_series.isCollected) {
              propagate = await DialogManager.showPropagationDialog(context);
            }

            if (!context.mounted) return;

            context.read<TrackerCubit>().upsertTracker(_merger, selectedStatus, propagate);
          }
      ),
    );
  }
}


























