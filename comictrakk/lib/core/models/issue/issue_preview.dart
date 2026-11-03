import 'package:comictrakk/core/models/reprint/reprint.dart';
import 'package:comictrakk/core/models/series/series_snippet.dart';
import 'package:comictrakk/core/models/series/series_detail.dart';
import 'package:comictrakk/core/models/trackable/trackable.dart';

class IssuePreview extends Trackable {

  final SeriesSnippet series;

  int number;
  String name;
  String imageUrl;

  IssuePreview(super.id, {required this.series, required this.number, required this.name,
    required this.imageUrl});

  factory IssuePreview.fromJson(Map<String, dynamic> json){
    return IssuePreview(
      series: SeriesSnippet.fromJson(json["series"]),
      json["id"],
      number: int.parse(json["number"].toString()),
      name: json["issue"],
      imageUrl: json["image"],
    );
  }

}