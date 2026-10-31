import 'package:comictrakk/objects/Issue/pojos/issue_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IssuePreviewListItem extends StatelessWidget {

  final IssuePreview issue;

  const IssuePreviewListItem({super.key, required this.issue});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => (),
      child: Row(
        children: [
          Image.network(issue.imageUrl, height: 80, width: 60, fit: BoxFit.contain),
          Expanded(child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("#${issue.number}: ${issue.name}"),
                Text("${issue.seriesDetail.name} Vol. ${issue.seriesDetail.volumeNumber} - ${issue.seriesDetail.yearBegan}")
              ],
            )
          )
        ]
      )
    );
  }
}