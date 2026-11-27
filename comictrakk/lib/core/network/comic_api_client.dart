import 'dart:convert';

import 'package:comictrakk/core/config/secrets.dart';
import 'package:comictrakk/core/network/models/api_headers.dart';
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

  Future<List<dynamic>> getSeriesByName(String name) async =>
      await _getResourceByName("series", name);

  Future<Map<String, dynamic>> getSeriesDetail(int seriesId) async =>
      await _getResourceDetail("series", seriesId);

  Future<List<dynamic>> fetchIssuesInSeries(int seriesId) async =>
      await _getResourceIssuesList("series", seriesId);

  Future<Map<String, dynamic>> fetchIssueDetail(int issueId) async =>
      await _getResourceDetail("issue", issueId);

  //region methods
  Future<List<dynamic>> _getResourceByName(
    String resourceName,
    String name,
  ) async {
    Uri uri = Uri.parse(
      '$_baseUrl/$resourceName/?name=${name.replaceAll(" ", "%20")}',
    );

    Map<String, dynamic> body = await _executeQuery(uri);

    return body["results"];
  }

  Future<List<dynamic>> _getResourceIssuesList(
    String resourceName,
    int resourceId,
  ) async {
    Uri uri = Uri.parse('$_baseUrl/$resourceName/$resourceId/issue_list');

    Map<String, dynamic> body = await _executeQuery(uri);

    return body["results"];
  }

  Future<Map<String, dynamic>> _getResourceDetail(
    String resourceName,
    int resourceId,
  ) async {
    Uri uri = Uri.parse('$_baseUrl/$resourceName/$resourceId');

    return await _executeQuery(uri);
  }

  DateTime nextPetitionThreshold = DateTime(1970);

  Future<Map<String, dynamic>> _executeQuery(Uri uri) async {
    DateTime petitionNow = DateTime.now();

    Duration nextPetitionRemainingTime = nextPetitionThreshold.difference(
      petitionNow,
    );

    if (!nextPetitionRemainingTime.isNegative) {
      await Future.delayed(nextPetitionRemainingTime);
    }

    print("deltalog: executing $uri");
    http.Response response = await http.get(
      uri,
      headers: {'Authorization': _tokenAuth},
    );

    if (response.statusCode == 200) {
      ApiHeaders headers = ApiHeaders.fromMap(response.headers);

      DateTime resetTime = DateTime.fromMillisecondsSinceEpoch(
        headers.burstReset * 1000,
      );
      DateTime resetNow = DateTime.now();

      double milisUntilReset =
          resetTime.difference(resetNow).inMilliseconds /
          headers.burstRemaining;

      nextPetitionThreshold = resetNow.add(
        Duration(milliseconds: milisUntilReset.ceil()),
      );

      return jsonDecode(response.body);
    } else {
      throw Exception("error code ${response.statusCode} on petition: $uri");
    }
  }
  //endregion
}
