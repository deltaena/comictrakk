import 'dart:convert';
import 'dart:io';

class MockHttpPetition {
  static Future<Map<String, dynamic>> getResponseFile(HttpPetitions petition) async {
    File seriesByNameResponse = File(petition.path);

    String fileContent = await seriesByNameResponse.readAsString();

    return jsonDecode(fileContent);
  }
}

enum HttpPetitions {
  seriesByName("/home/deltaena/Development/Workspace/comictrakk/test/core/network/responses/series_by_name_response.json"),
  seriesDetail("/home/deltaena/Development/Workspace/comictrakk/test/core/network/responses/series_detail_response.json"),
  seriesIssues("/home/deltaena/Development/Workspace/comictrakk/test/core/network/responses/series_issues_list_response.json"),
  seriesTypes("/home/deltaena/Development/Workspace/comictrakk/test/core/network/responses/series_type_response.json"),

  netSeriesByName("/home/deltaena/Development/Workspace/comictrakk/test/core/network/responses/net_series_by_name_response.json"),
  netSeriesIssues("/home/deltaena/Development/Workspace/comictrakk/test/core/network/responses/net_series_issues_response.json"),
  netSeriesDetail("/home/deltaena/Development/Workspace/comictrakk/test/core/network/responses/net_series_detail_response.json"),
  netIssueDetails("/home/deltaena/Development/Workspace/comictrakk/test/core/network/responses/net_issue_details_response.json");


  final String path;

  HttpPetitions(this.path);
}