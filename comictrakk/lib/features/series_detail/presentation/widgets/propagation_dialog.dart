import 'package:comictrakk/core/models/series/series_preview.dart';
import 'package:flutter/material.dart';

class PropagationDialog extends StatelessWidget {

  final SeriesPreview series;

  const PropagationDialog({super.key, required this.series});

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text(series.name),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Changing status of ${series.name} ${series.seriesType.name}'),
            Text(
              'Would you also like to change collected issues',
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
