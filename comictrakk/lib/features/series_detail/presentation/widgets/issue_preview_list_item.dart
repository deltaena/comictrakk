import 'package:comictrakk/core/models/issue/issue_detail.dart';
import 'package:comictrakk/core/models/issue/issue_preview.dart';
import 'package:comictrakk/core/enums/track_status.dart';
import 'package:comictrakk/core/models/series/series_detail.dart';
import 'package:comictrakk/core/local_database/models/tracker_row.dart';
import 'package:comictrakk/core/network/comic_api_client.dart';
import 'package:comictrakk/core/local_database/sqlite_service.dart';
import 'package:comictrakk/features/series_detail/presentation/widgets/propagation_dialog.dart';
import 'package:flutter/material.dart';

class IssuePreviewListItem extends StatefulWidget {

  final SeriesDetail series;
  final IssuePreview issue;

  const IssuePreviewListItem({super.key, required this.series, required this.issue});

  @override
  State<StatefulWidget> createState() { return _IssuePreviewListItem(); }
}

class _IssuePreviewListItem extends State<IssuePreviewListItem> {

  bool operating = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => (),
      child: SizedBox(
          height: 100,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: getImage()
              ),
              Expanded(
                flex: 6,
                child: getIssueInfo()
              ),
              Expanded(
                  flex: 2,
                  child: getTrackStatus()
              )
            ]
          )
      )
    );
  }

  Image getImage(){
    return Image.network(widget.issue.imageUrl, height: 80, width: 60, fit: BoxFit.contain);
  }

  Column getIssueInfo(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("id: ${widget.issue.id}"),
        Text("#${widget.issue.number}: ${widget.issue.name}"),
        Text("${widget.series.name} Vol. ${widget.series.volumeNumber} - ${widget.series.yearBegan}")
      ],
    );
  }

  Align getTrackStatus(){
    return Align(
      alignment: Alignment.bottomRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          getIcon(Icons.shopping_bag, TrackStatus.wished),
          getIcon(Icons.bookmark_add, TrackStatus.haveIt),
          getIcon(Icons.check_box, TrackStatus.read),
        ],
      )
    );
  }

  GestureDetector getIcon(IconData icon, TrackStatus iconTrackStatus){
    bool selectionAlreadyPicked = widget.issue.getTrackStatus().value == iconTrackStatus.value;

    return  GestureDetector(
      onTap: () => (upsertTrackStatus(iconTrackStatus)),
      child: Icon(
          icon,
          color: (selectionAlreadyPicked) ? Colors.green : Colors.black12,
      ),
    );
  }

  Future<void> upsertTrackStatus(TrackStatus selectedTrackStatus) async {
    if(operating) return;

    operating = true;

    if(widget.series.seriesType.isCollected){
      bool propagationAccepted = await showPropagationDialog(widget.series, selectedTrackStatus) ?? false;

      if(propagationAccepted){
        IssueDetail issueDetail = await ComicApiClient().getIssueDetail(widget.issue);

        await SqliteService().upsertTrackers(issueDetail.reprints, selectedTrackStatus);

        print("deltalog: propagated");
      }
    }

    bool success = await SqliteService().upsertTracker(widget.issue, selectedTrackStatus);

    if(success){
      updateState();
    }

    operating = false;
  }

  Future<void> updateState() async {
    List<TrackerRow> trackerRows = await SqliteService().getTracker(widget.issue);

    TrackStatus newStatus = TrackStatus.notTracking;

    if(trackerRows.length == 1) {
      newStatus = TrackStatus.fromInt(trackerRows[0].status);
    }

    setState(() {
      widget.issue.setTrackStatus(newStatus);
    });
  }

  Future<bool?> showPropagationDialog(SeriesDetail series, TrackStatus selectedTrackStatus) async {
    return await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return PropagationDialog(seriesDetail: series, selectedTrackStatus: selectedTrackStatus);
        }
    );
  }

}






























