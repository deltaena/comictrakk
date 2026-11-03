import 'package:comictrakk/core/models/series/series_preview.dart';
import 'package:comictrakk/core/models/series/series_type.dart';

class SeriesDetail extends SeriesPreview {

  final String sortName;
  final String language;
  final String status;
  final int yearEnd;
  final String description;

  new({required super.id, required super.name, required super.volumeNumber, required super.yearBegan,
    required super.seriesType, required this.sortName, required this.language, required this.status,
    required this.yearEnd, required this.description, required super.issueCount});

  factory SeriesDetail.fromJson(Map<String, dynamic> json){
    return SeriesDetail(
      id: json["id"],
      name: json["name"],
      volumeNumber: json["volume"],
      yearBegan: json["year_began"],

      seriesType: SeriesType.fromJson(json["series_type"]),

      sortName: json["sort_name"],
      language: json["language"],
      status: json["status"],
      yearEnd: json["year_end"] ?? -1,
      description: json["desc"],
      issueCount: json["issue_count"]
    );
  }
}