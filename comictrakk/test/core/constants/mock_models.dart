import 'package:comictrakk/core/enums/comic_tracking_status.dart';
import 'package:comictrakk/core/models/issue/issue_detail.dart';
import 'package:comictrakk/core/models/issue/issue_preview.dart';
import 'package:comictrakk/core/models/reprint/reprint.dart';
import 'package:comictrakk/core/models/series/series_preview.dart';
import 'package:comictrakk/core/models/series/series_snippet.dart';
import 'package:comictrakk/core/models/series/series_type.dart';

import 'mock_https_petition.dart';

class MockModels {

  final List<int> _issuesIds = [0, 1, 2, 3];

  final SeriesSnippet mockSeriesSnippet = SeriesSnippet.fromJson(
      const {"id": -1, "name": "series", "volume": -1, "year_began": -1});

  final List<IssuePreview> _mockTrackingIssues = List.empty(growable: true);
  List<IssuePreview> get mockTrackedIssues {
    if(_mockTrackingIssues.isNotEmpty) return _mockTrackingIssues;

    for(int id in _issuesIds){
      Map<String, dynamic> issueMap = {"id": id, "number": 0, "issue": "issue", "image": "https//:url"};

      _mockTrackingIssues.add(IssuePreview.fromJson(issueMap));
    }

    return _mockTrackingIssues;
  }

  final List<Reprint> _mockReprint = List.empty(growable: true);
    List<Reprint> get mockReprints {
    if(_mockReprint.isNotEmpty) return _mockReprint;

    for(int id in _issuesIds){
      Map<String, dynamic> issueMap = {"id": id, "issue": "issue"};

      _mockReprint.add(Reprint.fromJson(issueMap));
    }

    return _mockReprint;
  }

  final List<Map<String, dynamic>> _mockReprintMap = List.empty(growable: true);

  List<Map<String, dynamic>> get mockReprintsMap {
    if(_mockReprintMap.isNotEmpty) return _mockReprintMap;

    for(int id in _issuesIds) {
      _mockReprintMap.add({"id": id, "issue": "issue"});
    }

    return _mockReprintMap;
  }

  late IssueDetail mockIssueDetail = IssueDetail.fromJson({"id": 5, "number": -1, "title": "title", "image": "https://url", "reprints": mockReprintsMap});

  Future<List<SeriesPreview>> get mockSeriesPreviewAllTypes async {
    List<SeriesPreview> seriesPreviews = List.empty(growable: true);

    Map<String, dynamic> body = await MockHttpPetition.getResponseFile(HttpPetitions.seriesTypes);
    List<dynamic> results = body["results"];

    for(dynamic result in results){
      Map<String, dynamic> seriesType = result as Map<String, dynamic>;

      SeriesPreview mockSeriesPreview = SeriesPreview.fromJson(
          {"id": -1, "series": "series", "volume": -1, "year_began": -1, "issue_count": 0, "year_end": 1000, "series_type": seriesType});

      seriesPreviews.add(mockSeriesPreview);
    }

    return seriesPreviews;
  }
}