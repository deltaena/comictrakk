import 'package:comictrakk/objects/series/series_preview.dart';
import 'package:comictrakk/widgets/list_items/series_preview_list_item.dart';
import 'package:comictrakk/services/metron/metron_service.dart' show MetronService;
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
            const Text('series view'),
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
                MetronService().searchSeriesPreviewByName("spider-man noir").then((seriesRes) {
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