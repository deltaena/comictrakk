import 'dart:collection';

import 'package:comictrakk/objects/issue/issue_detail.dart';
import 'package:comictrakk/objects/issue/issue_preview.dart';
import 'package:comictrakk/widgets/list_items/issue_preview_list_item.dart';
import 'package:comictrakk/objects/series/series_detail.dart';
import 'package:comictrakk/objects/series/series_preview.dart';
import 'package:comictrakk/objects/enum_variables/track_status.dart';
import 'package:comictrakk/objects/sqlite_rows/tracker_row.dart';
import 'package:comictrakk/services/metron/metron_service.dart';
import 'package:comictrakk/services/storage/sqlite_service.dart';
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
                  return IssuePreviewListItem(series: seriesDetail, issue: issuesPreviews[index]);
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
    setState(() => seriesDetail = series);

    List<IssuePreview> issues = await loadIssuesPreviews(series);
    setState(() => issuesPreviews.addAll(issues));
  }

  Future<SeriesDetail> loadSeriesDetail() {
    return MetronService().getSeriesDetail(widget.seriesPreview);
  }

  Future<IssueDetail> loadIssueDetails(SeriesDetail series) async {
    IssueDetail foundIssue = await MetronService().getSeriesIssueDetailList(series);

    return foundIssue;
  }
  Future<List<IssuePreview>> loadIssuesPreviews(SeriesDetail series) async {
    List<IssuePreview> foundIssues = await MetronService().getSeriesIssuePreviewList(series);

    List<TrackerRow> rowsList = await SqliteService().getTrackers(foundIssues);

    Map<int, TrackerRow> rowsMap = {
      for (var row in rowsList) row.id: row
    };

    for(IssuePreview issue in foundIssues){
      if(rowsMap.containsKey(issue.id)){
        TrackStatus issueStatus = TrackStatus.fromInt(rowsMap[issue.id]!.status);

        issue.setTrackStatus(issueStatus);
      }
    }

    return foundIssues;
  }
}






















