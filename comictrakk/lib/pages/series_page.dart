import 'package:comictrakk/metron/metron_service.dart';
import 'package:comictrakk/objects/Issue/pojos/issue_preview.dart';
import 'package:comictrakk/objects/Issue/widgets/issue_preview_list_item.dart';
import 'package:comictrakk/objects/Series/pojos/series_detail.dart';
import 'package:comictrakk/objects/Series/pojos/series_preview.dart';
import 'package:flutter/material.dart';

class SeriesPage extends StatefulWidget {

  final SeriesPreview seriesPreview;

  const SeriesPage({super.key, required this.seriesPreview});

  @override
  State<SeriesPage> createState() {
    return _SeriesPage();
  }
}

class _SeriesPage extends State<SeriesPage> {

  late final SeriesDetail seriesDetail;
  final List<IssuePreview> issuesPreviews = List.empty(growable: true);

  @override
  void initState() {
    super.initState();

    loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.seriesPreview.name)),
      body: Column(
        children: [
          Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: issuesPreviews.length,
                itemBuilder: (BuildContext context, int index) {
                  return IssuePreviewListItem(issue: issuesPreviews[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Padding(padding: EdgeInsetsGeometry.fromLTRB(0, 2, 0, 2),
                    child: SizedBox(
                      height: 1.0,
                      width: double.infinity,
                      child: ColoredBox(color: Color(0xFF000000)),
                    )
                  );
                },
              )
          )
        ],
      ),
    );
  }

  Future<void> loadInitialData() async {
    SeriesDetail series = await loadSeriesDetail();
    List<IssuePreview> issues = await loadIssuesPreviews(series);

    setState(() {
      seriesDetail = series;
      issuesPreviews.addAll(issues);
    });
  }

  Future<SeriesDetail> loadSeriesDetail() {
    return MetronService().getSeriesDetail(widget.seriesPreview);
  }

  Future<List<IssuePreview>> loadIssuesPreviews(SeriesDetail series){
    return MetronService().getSeriesIssueList(series);
  }
}






















