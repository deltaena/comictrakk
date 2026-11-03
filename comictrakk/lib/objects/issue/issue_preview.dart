import 'package:comictrakk/objects/reprint/reprint.dart';
import 'package:comictrakk/objects/series/base_series.dart';
import 'package:comictrakk/objects/series/series_detail.dart';
import 'package:comictrakk/objects/trackable/trackable.dart';

class IssuePreview extends Trackable {

  final BaseSeries series;

  int number;
  String name;
  String imageUrl;

  IssuePreview(super.id, {required this.series, required this.number, required this.name,
    required this.imageUrl});

  factory IssuePreview.fromJson(Map<String, dynamic> json){
    return IssuePreview(
      series: BaseSeries.fromJson(json["series"]),
      json["id"],
      number: int.parse(json["number"].toString()),
      name: json["issue"],
      imageUrl: json["image"],
    );
  }

}