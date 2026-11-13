import 'package:comictrakk/core/models/issue/issue_detail.dart';
import 'package:comictrakk/core/models/issue/issue_preview.dart';
import 'package:comictrakk/core/models/series/series_detail.dart';
import 'package:comictrakk/core/models/series/series_preview.dart';
import 'package:comictrakk/core/models/series/series_snippet.dart';
import 'package:comictrakk/core/network/comic_api_client.dart';
import 'package:flutter_test/flutter_test.dart';

import '../constants/mock_https_petition.dart';

void main(){

  group("comic api test", (){

    Future<Iterable<SeriesPreview>> getSearchedSeries() async {
      Map<String, dynamic> mockJson = await MockHttpPetition.getResponseFile(HttpPetitions.netSeriesByName);
      List<dynamic> jsonSeries = mockJson["results"];
      return jsonSeries.map((json) => SeriesPreview.fromJson(json));
    }
    Future<Iterable<IssuePreview>> getSeriesIssues() async {
      Map<String, dynamic> issuesResponse = await MockHttpPetition.getResponseFile(HttpPetitions.netSeriesIssues);
      List<dynamic> issuesJson = issuesResponse["results"];

      return issuesJson.map((issue) => IssuePreview.fromJson(issue));
    }

    Future<SeriesDetail> getSeriesDetails() async {
      Map<String, dynamic> detailsJson = await MockHttpPetition.getResponseFile(HttpPetitions.netSeriesDetail);

      return SeriesDetail.fromJson(detailsJson);
    }

    Future<IssueDetail> getIssueDetails() async {
      Map<String, dynamic> detailsJson = await MockHttpPetition.getResponseFile(HttpPetitions.netIssueDetails);

      return IssueDetail.fromJson(detailsJson);
    }

    test("getSeriesByName", () async {
      Map<int, SeriesPreview> localSeries = { for(SeriesPreview series in await getSearchedSeries()) series.id: series };

      List<SeriesPreview> netSeries = await ComicApiClient().getSeriesByName("the darkness");

      expect(netSeries.length, localSeries.length);

      for(SeriesPreview series in netSeries){
        expect(localSeries[series.id], series);
      }
    });

    test("getSeriesByName empty", () async {
      List<SeriesPreview> netSeries = await ComicApiClient().getSeriesByName("_*");

      expect(netSeries.length, 0);
    });

    test("getSeriesDetails", () async {
      SeriesDetail localDetails = await getSeriesDetails();

      SeriesPreview seriesToSearch = (await getSearchedSeries()).firstWhere((item) => item.id == localDetails.id);

      SeriesDetail netDetails = await ComicApiClient().getSeriesDetail(seriesToSearch);

      expect(localDetails.hashCode, netDetails.hashCode);
      expect(localDetails, netDetails);
    });
    
    test("getSeriesIssues", () async {
      Map<int, IssuePreview> issuesMap = { for(IssuePreview issue in await getSeriesIssues()) issue.id: issue };

      List<IssuePreview> netIssues = await ComicApiClient().getSeriesIssues(await getSeriesDetails());

      expect(issuesMap.keys.length, netIssues.length);

      for(IssuePreview issue in netIssues){
        expect(issue, issuesMap[issue.id]);
      }
    });

    test("getIssueDetails", () async {
      IssueDetail localDetails = await getIssueDetails();

      IssuePreview issueToSearch = (await getSeriesIssues()).firstWhere((item) => item.id == localDetails.id);

      IssueDetail netDetails = await ComicApiClient().getIssueDetail(issueToSearch);

      expect(localDetails.hashCode, netDetails.hashCode);
      expect(localDetails, netDetails);
    });


    test("getSeriesDetails not found", () async {
      String errorMsg = "Exception: error code 404 on petition: https://metron.cloud/api/series/-1";

      SeriesSnippet badSnippet = SeriesSnippet.fromJson({"id": -1, "name": "name", "volume": 0, "year_began": 1111});

      expect(() async => (await ComicApiClient().getSeriesDetail(badSnippet)), throwsA(allOf(isA<Exception>(), predicate((e) => e.toString() == errorMsg))));
    });

  });

}