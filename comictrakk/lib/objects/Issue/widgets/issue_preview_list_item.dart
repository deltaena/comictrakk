import 'package:comictrakk/objects/Issue/pojos/issue_preview.dart';
import 'package:comictrakk/objects/enum_variables/track_status.dart';
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
      onTap: () => (updateTrackStatus(iconTrackStatus)),
      child: Icon(
          icon,
          color: (selectionAlreadyPicked) ? Colors.green : Colors.black12
      ),
    );
  }

  Future<void> updateTrackStatus(TrackStatus selectedTrackStatus) async {
    if(operating) return;

    operating = true;

    bool selectionAlreadyPicked = widget.issue.getTrackStatus().value == selectedTrackStatus.value;
    TrackStatus newTrackStatus = (selectionAlreadyPicked) ? TrackStatus.notTracking : selectedTrackStatus;

    bool result = await SqliteService().updateTracker(widget.issue, newTrackStatus);

    if(result){
      Map<String, Object?> updatedIssue = await SqliteService().getTracker(widget.issue);

      setState(() {
        widget.issue.setTrackStatus(TrackStatus.fromInt(int.parse(updatedIssue["status"].toString())));
      });
    }

    operating = false;
  }
}