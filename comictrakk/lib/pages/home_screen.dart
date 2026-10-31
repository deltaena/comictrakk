import 'package:comictrakk/metron/metron_service.dart';
import 'package:comictrakk/objects/Series/pojos/series_preview.dart';
import 'package:comictrakk/objects/Series/widgets/series_preview_list_item.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  final List<SeriesPreview> series = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AppBar Demo'),
        ),
        body:
        Column(
          children: <Widget>[
            const Text('Series view'),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: series.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SeriesPreviewListItem(series: series[index]);
                  }
              ),
            ),
            FloatingActionButton.large(
              onPressed: () {
                MetronService().searchSeriesPreviewByName("Absolute Carnage").then((seriesRes) {
                  setState(() {
                    series.addAll(seriesRes);
                  });
                });
              },
              child: const Icon(Icons.add),
            ),
          ],
        )
    );
  }
}