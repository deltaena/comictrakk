import 'dart:async';

import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/issues/cubit/issue_state.dart';
import 'package:comictrakk/features/issues/data/issue_mapper.dart';
import 'package:comictrakk/features/issues/data/issue_repository.dart';
import 'package:comictrakk/features/issues/models/issue_row_merger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IssueCubit extends Cubit<IssueState> {
  final IssueMapper _mapper = IssueMapper();
  final IssueRepository _repo;

  StreamSubscription<List<IssueRowMerger>>? _subscription;

  new(this._repo) : super(IssueLoading());

  void watchTrackedIssues() {
    _subscription = _repo.watchTrackedIssues().listen((issues) {
      emit(IssueLoaded(_mapper.fromRowMergers(issues)));
    }, onError: (e) => emit(IssueError(e.toString())));
  }

  void listenToIssuesInSeries(Series series) {
    _subscription = _repo.watchIssuesInSeries(series.id).listen((issues) {
      emit(IssueLoaded(_mapper.fromRowMergers(issues)));
    }, onError: (e) => emit(IssueError(e.toString())));
  }

  void fetchIssuesInSeries(Series series) {
    emit(IssueLoading());

    _repo.fetchIssuesInSeries(series.id);
  }

  void fetchIssueDetails(Issue issue) {
    emit(IssueLoading());

    _repo.fetchIssuesDetails(issue.id);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
