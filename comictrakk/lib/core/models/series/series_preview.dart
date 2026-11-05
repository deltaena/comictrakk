import 'package:comictrakk/core/models/series/series_snippet.dart';
import 'package:comictrakk/core/models/series/series_type.dart';

class SeriesPreview extends SeriesSnippet {

  late SeriesType seriesType;
  late int issueCount;
  late int yearEnd;

  SeriesPreview({required super.id, required super.name, required super.volumeNumber, required super.yearBegan,
    required this.issueCount, required this.seriesType, required this.yearEnd});

  factory SeriesPreview.fromJson(Map<String, dynamic> json){
    return SeriesPreview(
      id: json["id"],
      name: json["series"],
      volumeNumber: json["volume"],
      yearBegan: json["year_began"],
      yearEnd: json["year_end"] ?? -1,
      issueCount: json["issue_count"],

      seriesType: SeriesType.fromJson(json["series_type"])
    );
  }
}