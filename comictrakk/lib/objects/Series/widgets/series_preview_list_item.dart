import 'package:comictrakk/objects/Series/pojos/series_preview.dart';
import 'package:comictrakk/pages/series_page.dart';
import 'package:flutter/cupertino.dart';
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
        child: Column(
          children: [
            Center(child: Text("${series.name} Vol. ${series.volumeNumber}")),
            Center(child: Text(series.seriesType.name))
          ]
        ),
      )
    );
  }

}