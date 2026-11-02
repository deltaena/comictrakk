import 'dart:convert';

import 'package:comictrakk/helpers/secrets.dart';
import 'package:comictrakk/objects/issue/issue_preview.dart';
import 'package:comictrakk/objects/series/series_detail.dart';
import 'package:comictrakk/objects/series/series_preview.dart';
import 'package:http/http.dart' as http;

class MetronService {

  final String _baseUrl = "https://metron.cloud/api";

  late final String _tokenAuth = 'Bearer ${Secrets().token}';

  //region singleton
  static final MetronService _singleton = MetronService._internal();

  factory MetronService() {
    return _singleton;
  }

  MetronService._internal();
  //endregion

  //region search by name
  Future<List<SeriesPreview>> searchSeriesPreviewByName(String name) async {
    List<dynamic> seriesMaps = await _searchResourceByName("series", name);

    return seriesMaps.map((seriesMap) => SeriesPreview.fromJson(seriesMap)).toList();
  }

  Future<List<dynamic>> _searchResourceByName(String resourceName, String name) async {
    Uri uri = Uri.parse('$_baseUrl/$resourceName/?name=${name.replaceAll(" ", "%20")}');

    Map<String, dynamic> body = await _executeQuery(uri);

    return body["results"];
  }
  //endregion

  //region get issues_list
  Future<List<IssuePreview>> getSeriesIssueList(SeriesDetail series) async {
    List<dynamic> issuesMap = await _getResourceIssuesList("series", series.id);

    return issuesMap.map((issueMap) => IssuePreview.fromJson(series, issueMap)).toList();
  }


  Future<List<dynamic>> _getResourceIssuesList(String resourceName, int resourceId) async {
    Uri uri =  Uri.parse('$_baseUrl/$resourceName/$resourceId/issue_list');

    Map<String, dynamic> body = await _executeQuery(uri);

    return body["results"];
  }
  //endregion

  //region search details
  Future<SeriesDetail> getSeriesDetail(SeriesPreview series) async {
    Map<String, dynamic> detailMap = await _getResourceDetail("series", series.id);

    return SeriesDetail.fromJson(detailMap);
  }

  Future<Map<String, dynamic>> _getResourceDetail(String resourceName, int resourceId) async {
    Uri uri = Uri.parse('$_baseUrl/$resourceName/$resourceId');

    return await _executeQuery(uri);
  }
  //endregion

  Future<Map<String, dynamic>> _executeQuery(Uri uri) async {
    http.Response response = await http.get(uri,
      headers: {'Authorization': _tokenAuth},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("error code ${response.statusCode} on petition: $uri");
    }
  }
}