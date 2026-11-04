import 'package:comictrakk/core/models/series/series_preview.dart';
import 'package:comictrakk/features/series_detail/presentation/views/series_detail_page.dart';
import 'package:flutter/material.dart';

class SeriesPreviewListItem extends StatelessWidget {
  final SeriesPreview seriesPreview;

  const SeriesPreviewListItem({super.key, required this.seriesPreview});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSeriesTapped(context),
      child: SizedBox(
        height: 70,
        child: Row(
          children: [
            getCenterRow(),
            getLeadingRow()
          ],
        ),
      ),
    );
  }

  void onSeriesTapped(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => SeriesDetailPage(seriesPreview: seriesPreview),
      ),
    );
  }

  Expanded getLeadingRow(){
    return Expanded(
      flex: 1,
      child: Center(child: Text("${seriesPreview.issueCount}")),
    );
  }

  Expanded getCenterRow(){
    return Expanded(
      flex: 15,
      child: Column(
        children: [
          Text(seriesPreview.name,
            overflow: TextOverflow.ellipsis,
          ),
          Text("Vol. ${seriesPreview.volumeNumber} - ${seriesPreview.yearBegan} - ${seriesPreview.seriesType.name}"),
        ],
      ),
    );
  }
}
