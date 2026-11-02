import 'package:comictrakk/objects/series/base_series.dart';
import 'package:comictrakk/objects/series/series_type.dart';

class SeriesPreview extends BaseSeries {

  late SeriesType seriesType;
  late int issueCount;

  SeriesPreview({required super.id, required super.name, required super.volumeNumber, required super.yearBegan,
    required this.issueCount, required this.seriesType});

  factory SeriesPreview.fromJson(Map<String, dynamic> json){
    return SeriesPreview(
      id: json["id"],
      name: json["series"],
      volumeNumber: json["volume"],
      yearBegan: json["year_began"],
      issueCount: json["issue_count"],

      seriesType: SeriesType.fromJson(json["series_type"])
    );
  }
}