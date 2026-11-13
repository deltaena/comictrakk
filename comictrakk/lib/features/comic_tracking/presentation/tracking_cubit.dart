import 'package:comictrakk/core/enums/comic_tracking_status.dart';
import 'package:comictrakk/core/local_database/models/tracker_row.dart';
import 'package:comictrakk/core/local_database/sqlite_service.dart';
import 'package:comictrakk/core/models/issue/issue_detail.dart';
import 'package:comictrakk/core/models/issue/issue_preview.dart';
import 'package:comictrakk/core/models/reprint/reprint.dart';
import 'package:comictrakk/core/network/comic_api_client.dart';
import 'package:comictrakk/features/comic_tracking/presentation/tracking_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackingCubit extends Cubit<TrackingState> {

  late final ComicApiClient _comicApi;
  late final SqliteService _dbApi;

  bool operating = false;

  TrackingCubit({ComicApiClient? mockApi, SqliteService? mockDb}) :
        _comicApi = mockApi ?? ComicApiClient(), _dbApi = mockDb ?? SqliteService(),  super(TrackingLoading());

  Future<void> loadInitialStatuses(List<IssuePreview> issues) async {
    List<TrackerRow> rows = List.empty(growable: true);

    try {
      rows.addAll(await _dbApi.getTrackers(issues));
    } catch(e){
      emit(TrackingError(message: "Failed to get initial statuses"));
      return;
    }

    Map<int, TrackerRow> res = { for (TrackerRow row in rows) row.id: row };

    for(IssuePreview issue in issues){
      if(res.containsKey(issue.id)){
        int issueStatus = issue.getComicStatus().value;
        int dbStatus = res[issue.id]!.status;

        if(issueStatus != dbStatus){
          issue.setComicStatus(ComicTrackingStatus.fromInt(dbStatus));
        }
      }
    }

    emit(TrackingLoaded(trackables: issues));
  }

  Future<void> updateTrackingStatus(IssuePreview issue, ComicTrackingStatus selectedStatus, [bool propagate = false]) async {
    if(operating) return;
    operating = true;

    ComicTrackingStatus newStatus = selectedStatus;
    
    if(issue.getComicStatus().value == selectedStatus.value) newStatus = ComicTrackingStatus.notTracking;

    try {
      await _dbApi.upsertTracker(issue, newStatus);
    } catch(e) {
      emit((TrackingError(message: 'Failed to update tracking status')));
      return;
    }

    issue.setComicStatus(newStatus);


    if(propagate){
      IssueDetail issueDetail = await _comicApi.getIssueDetail(issue);
      List<Reprint> reprints = issueDetail.reprints;

      try {
        await _dbApi.upsertTrackers(reprints, newStatus);
      } catch(e){
        emit(TrackingError(message: 'Failed to propagate status'));
        return;
      }

      for (var reprint in reprints) {
        reprint.setComicStatus(newStatus);
      }
    }

    emit(TrackingUpdated(trackables: List.filled(1, issue)));

    operating = false;
  }
}