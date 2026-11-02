import 'package:comictrakk/objects/issue/issue_preview.dart';
import 'package:comictrakk/objects/enum_variables/track_status.dart';
import 'package:comictrakk/objects/sqlite_rows/tracker_row.dart';
import 'package:comictrakk/services/storage/sqlite_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IssuePreviewListItem extends StatefulWidget{

  final IssuePreview issue;

  const IssuePreviewListItem({super.key, required this.issue});

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
          height: 90,
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
        Text("${widget.issue.seriesDetail.name} Vol. ${widget.issue.seriesDetail.volumeNumber} - ${widget.issue.seriesDetail.yearBegan}")
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

    bool success = await SqliteService().upsertTracker(widget.issue, selectedTrackStatus);

    if(success){
      updateState();
    }

    operating = false;
  }

  Future<void> updateState() async {
    List<TrackerRow> trackerRows = await SqliteService().getTracker(widget.issue);

    TrackStatus newStatus = TrackStatus.notTracking;

    if(trackerRows.length == 1){
      newStatus = TrackStatus.fromInt(trackerRows[0].status);
    }

    setState(() {
      widget.issue.setTrackStatus(newStatus);
    });
  }

  Future<void> _propagationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Changing status of omnibus to ...'),
                Text('Would you like to apply to all issues this omnibus contains?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Deny'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}