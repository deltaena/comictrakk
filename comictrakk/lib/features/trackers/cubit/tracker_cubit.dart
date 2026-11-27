import 'dart:async';

import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/issues/data/issue_repository.dart';
import 'package:comictrakk/features/issues/models/issue_merger.dart';
import 'package:comictrakk/features/reprints/data/reprints_repository.dart';
import 'package:comictrakk/features/trackers/constants/operation.dart';
import 'package:comictrakk/features/trackers/constants/tracker_status.dart';
import 'package:comictrakk/features/trackers/cubit/tracker_state.dart';
import 'package:comictrakk/features/trackers/data/tracker_mapper.dart';
import 'package:comictrakk/features/trackers/data/tracker_repository.dart';
import 'package:comictrakk/features/trackers/models/tracker_merger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackerCubit extends Cubit<TrackerState> {
  final TrackerRepository _repo;
  final IssueRepository _issuesRepo;
  final TrackerMapper _mapper = TrackerMapper();

  final ReprintRepository _reprintRepo;

  StreamSubscription<List<TrackerMerger>>? _subscription;

  new({required this._repo, required this._issuesRepo, required this._reprintRepo}) : super(TrackerInitial());

  Future<void> listenToTrackersInSeries(Series series) async {
    await _subscription?.cancel();

    _subscription = _repo
        .watchTrackersBySeries(series.id)
        .listen(
          (trackerMergers) {
            if (isClosed) return;
            emit(TrackerLoaded(trackerMergers));
          },
          onError: (e) {
            if (isClosed) return;
            emit(TrackerError(e.toString()));
          },
        );
  }

  Future<void> upsertTracker(IssueMerger merger, TrackerStatus selectedStatus, bool propagate) async {
    bool deleteTracker = await _repo.trackerExists(merger.issue.id, selectedStatus);
    Operation operation = deleteTracker ? .delete : .insert;

    final issueOperation = _mapper.fromNewStatus(merger.issue, selectedStatus, operation);
    
    List<Reprint> reprints = [];

    if(propagate){
      await _issuesRepo.fetchIssuesDetails(merger.issue.id);
      reprints = await _reprintRepo.getReprintsOfCollection(merger.issue.id);
    }

    _repo.upsertTracker(issueOperation, reprints);
  }



  @override
  Future<void> close() async {
    await _subscription?.cancel();
    _subscription = null;

    return super.close();
  }
}
