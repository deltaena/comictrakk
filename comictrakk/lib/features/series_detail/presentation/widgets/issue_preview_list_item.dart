import 'package:comictrakk/core/models/issue/issue_preview.dart';
import 'package:comictrakk/core/enums/comic_tracking_status.dart';
import 'package:comictrakk/core/models/series/series_detail.dart';
import 'package:flutter/material.dart';

class IssuePreviewListItem extends StatelessWidget {

  final SeriesDetail series;
  final IssuePreview issue;
  final Function(ComicTrackingStatus selectedStatus) onStatusSelected;

  const IssuePreviewListItem({super.key, required this.series, required this.issue, required this.onStatusSelected});

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
    return Image.network(issue.imageUrl, height: 80, width: 60, fit: BoxFit.contain);
  }

  Column getIssueInfo(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("id: ${issue.id}"),
        Text("#${issue.number}: ${issue.name}"),
      ],
    );
  }

  Align getTrackStatus(){
    return Align(
      alignment: Alignment.bottomRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          getIcon(Icons.shopping_bag, ComicTrackingStatus.wished),
          getIcon(Icons.bookmark_add, ComicTrackingStatus.have),
          getIcon(Icons.check_box, ComicTrackingStatus.read),
        ],
      )
    );
  }

  GestureDetector getIcon(IconData icon, ComicTrackingStatus iconTrackStatus){
    bool selectionAlreadyPicked = issue.getComicStatus().value == iconTrackStatus.value;

    return  GestureDetector(
      onTap: () => (onStatusSelected(iconTrackStatus)),
      child: Icon(
          icon,
          color: (selectionAlreadyPicked) ? Colors.green : Colors.black12,
      ),
    );
  }

}






























