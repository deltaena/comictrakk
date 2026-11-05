import 'package:comictrakk/core/enums/track_status.dart';
import 'package:comictrakk/core/local_database/models/tracker_row.dart';
import 'package:comictrakk/core/local_database/sqlite_service.dart';
import 'package:comictrakk/core/models/issue/issue_detail.dart';
import 'package:comictrakk/core/models/issue/issue_preview.dart';
import 'package:comictrakk/core/models/reprint/reprint.dart';
import 'package:comictrakk/core/network/comic_api_client.dart';
import 'package:comictrakk/features/comic_tracking/presentation/tracking_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackingCubit extends Cubit<TrackingState> {

  bool operating = false;

  TrackingCubit() : super(TrackingLoading());

  Future<void> loadInitialStatuses(List<IssuePreview> issues) async {
    List<TrackerRow> rows = await SqliteService().getTrackers(issues);

    Map<int, TrackerRow> res = { for (TrackerRow row in rows) row.id: row };

    for(IssuePreview issue in issues){
      if(res.containsKey(issue.id)){
        int issueStatus = issue.getComicStatus().value;
        int dbStatus = res[issue.id]!.status;

        if(issueStatus != dbStatus){
          issue.setComicStatus(ComicStatus.fromInt(dbStatus));
        }
      }
    }

    emit(TrackingLoaded(trackables: issues));
  }

  Future<void> updateTrackingStatus(IssuePreview issue, ComicStatus selectedStatus, [bool propagate = false]) async {
    if(operating) return;

    operating = true;

    ComicStatus newStatus = selectedStatus;
    
    if(issue.getComicStatus().value == selectedStatus.value) newStatus = ComicStatus.notTracking;

    bool success = await SqliteService().upsertTracker(issue, newStatus);

    if(success){
      issue.setComicStatus(newStatus);

      if(propagate){
        IssueDetail issueDetail = await ComicApiClient().getIssueDetail(issue);
        List<Reprint> reprints = issueDetail.reprints;

        await SqliteService().upsertTrackers(reprints, newStatus);
        
        for (var reprint in reprints) {
          reprint.setComicStatus(newStatus);
        }
      }

      emit(TrackingUpdated(trackables: List.filled(1, issue)));
    }

    operating = false;
  }
}