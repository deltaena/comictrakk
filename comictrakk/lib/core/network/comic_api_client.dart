import 'dart:convert';

import 'package:comictrakk/core/config/secrets.dart';
import 'package:comictrakk/core/models/issue/issue_detail.dart';
import 'package:comictrakk/core/models/issue/issue_preview.dart';
import 'package:comictrakk/core/models/series/series_detail.dart';
import 'package:comictrakk/core/models/series/series_preview.dart';
import 'package:http/http.dart' as http;

class ComicApiClient {

  final String _baseUrl = "https://metron.cloud/api";

  late final String _tokenAuth = 'Bearer ${Secrets().token}';

  //region singleton
  static final ComicApiClient _singleton = ComicApiClient._internal();

  factory ComicApiClient() {
    return _singleton;
  }

  ComicApiClient._internal();
  //endregion

  Future<List<SeriesPreview>> searchSeriesPreviewByName(String name) async {
    List<dynamic> seriesMaps = await _searchResourceByName("series", name);

    return seriesMaps.map((seriesMap) => SeriesPreview.fromJson(seriesMap)).toList();
  }
  
  Future<IssueDetail> getSeriesIssueDetailList(SeriesDetail series) async {
    Map<String, dynamic> issuesMap = await _getResourceDetail("issue", series.id);

    return IssueDetail.fromJson(issuesMap);
  }
  Future<List<IssuePreview>> getSeriesIssuePreviewList(SeriesDetail series) async {
    List<dynamic> issuesMap = await _getResourceIssuesList("series", series.id);

    return issuesMap.map((issueMap) => IssuePreview.fromJson(issueMap)).toList();
  }

  Future<SeriesDetail> getSeriesDetail(SeriesPreview series) async {
    Map<String, dynamic> detailMap = await _getResourceDetail("series", series.id);

    return SeriesDetail.fromJson(detailMap);
  }
  Future<IssueDetail> getIssueDetail(IssuePreview issue) async {
    Map<String, dynamic> detailMap = await _getResourceDetail("issue", issue.id);

    return IssueDetail.fromJson(detailMap);
  }

  //region methods
  Future<List<dynamic>> _searchResourceByName(String resourceName, String name) async {
    Uri uri = Uri.parse('$_baseUrl/$resourceName/?name=${name.replaceAll(" ", "%20")}');

    Map<String, dynamic> body = await _executeQuery(uri);

    return body["results"];
  }

  Future<List<dynamic>> _getResourceIssuesList(String resourceName, int resourceId) async {
    Uri uri =  Uri.parse('$_baseUrl/$resourceName/$resourceId/issue_list');

    Map<String, dynamic> body = await _executeQuery(uri);

    return body["results"];
  }

  Future<Map<String, dynamic>> _getResourceDetail(String resourceName, int resourceId) async {
    Uri uri = Uri.parse('$_baseUrl/$resourceName/$resourceId');

    return await _executeQuery(uri);
  }

  Future<Map<String, dynamic>> _executeQuery(Uri uri) async {
    print("deltalog: executing $uri");

    http.Response response = await http.get(uri,
      headers: {'Authorization': _tokenAuth},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("error code ${response.statusCode} on petition: $uri");
    }
  }
  //endregion
}