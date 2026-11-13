import 'package:comictrakk/core/models/issue/issue_detail.dart';
import 'package:comictrakk/core/models/issue/issue_preview.dart';
import 'package:comictrakk/core/models/series/series_detail.dart';
import 'package:comictrakk/core/models/series/series_preview.dart';
import 'package:comictrakk/core/models/series/series_snippet.dart';
import 'package:comictrakk/core/network/comic_api_client.dart';
import 'package:mocktail/mocktail.dart';

import '../constants/mock_https_petition.dart';
import '../constants/mock_models.dart';

class MockComicApiClient extends Mock implements ComicApiClient {

  String _testBehaviour = "";

  set testBehaviour(String value) { _testBehaviour = value; }

  @override
  Future<IssueDetail> getIssueDetail(IssuePreview issue) async {
    if(_testBehaviour == "wait") await Future.delayed(Duration(seconds: 1));
    if(_testBehaviour == "fail") throw Exception("Something went wrong...");

    return MockModels().mockIssueDetail;
  }

  @override
  Future<SeriesDetail> getSeriesDetail(SeriesSnippet series) async {
    if(_testBehaviour == "wait") await Future.delayed(Duration(seconds: 1));
    if(_testBehaviour == "fail") throw Exception("Something went wrong...");

    Map<String, dynamic> mockJson = await MockHttpPetition.getResponseFile(HttpPetitions.seriesDetail);

    return SeriesDetail.fromJson(mockJson);
  }

  @override
  Future<List<IssuePreview>> getSeriesIssues(SeriesSnippet series) async {
    if(_testBehaviour == "wait") await Future.delayed(Duration(seconds: 1));
    if(_testBehaviour == "fail") throw Exception("Something went wrong...");

    Map<String, dynamic> mockJson = await MockHttpPetition.getResponseFile(HttpPetitions.seriesIssues);
    List<dynamic> jsonIssues = mockJson["results"];

    return jsonIssues.map((json) => IssuePreview.fromJson(json)).toList();
  }

  @override
  Future<List<SeriesPreview>> getSeriesByName(String seriesName) async {
    if(_testBehaviour == "wait") await Future.delayed(Duration(seconds: 1));
    if(_testBehaviour == "fail") throw Exception("Something went wrong...");

    try {
      Map<String, dynamic> mockJson = await MockHttpPetition.getResponseFile(HttpPetitions.seriesByName);
      List<dynamic> jsonSeries = mockJson["results"];

      return jsonSeries
          .map((json) => SeriesPreview.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception("getSeriesByName finished, nothing returned");
    }
  }

}