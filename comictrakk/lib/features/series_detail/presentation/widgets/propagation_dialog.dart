import 'package:comictrakk/core/enums/track_status.dart';
import 'package:comictrakk/core/models/series/series_detail.dart';
import 'package:flutter/material.dart';

class PropagationDialog extends StatelessWidget {

  final SeriesDetail seriesDetail;
  final TrackStatus selectedTrackStatus;

  const PropagationDialog({super.key, required this.seriesDetail, required this.selectedTrackStatus});

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text(selectedTrackStatus.name),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Changing status of ${seriesDetail.name} ${seriesDetail.seriesType.name} to ${selectedTrackStatus.name}'),
            Text(
              'Would you also like to change all issues ${seriesDetail.name}} contains to ${selectedTrackStatus.name}?',
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Deny'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: const Text('Approve'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
