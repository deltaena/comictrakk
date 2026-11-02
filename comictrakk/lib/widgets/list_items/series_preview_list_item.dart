import 'package:comictrakk/objects/series/series_preview.dart';
import 'package:comictrakk/pages/series_page.dart';
import 'package:flutter/material.dart';

class SeriesPreviewListItem extends StatelessWidget {

  final SeriesPreview series;

  const SeriesPreviewListItem({super.key, required this.series});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute<void>(
              builder: (context) => SeriesPage(seriesPreview: series)),
            ),
      },
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Expanded(
              flex: 15,
              child: Column(
                children: [
                  Text("${series.name} Vol. ${series.volumeNumber}", overflow: TextOverflow.ellipsis,),
                  Text(series.seriesType.name)
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(child: Text("${series.issueCount}"))
            )
          ]
        ),
      )
    );
  }

}