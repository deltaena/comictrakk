import 'package:comictrakk/core/models/issue/issue_preview.dart';
import 'package:comictrakk/core/models/reprint/reprint.dart';
import 'package:comictrakk/core/models/series/series_snippet.dart';
import 'package:comictrakk/core/models/series/series_detail.dart';

class IssueDetail extends IssuePreview {

  late List<Reprint> reprints;

  new(super.id, {required super.series, required super.number, required super.name, required super.imageUrl,
    required this.reprints});

  factory IssueDetail.fromJson(Map<String, dynamic> json){
    return IssueDetail(
      series: SeriesSnippet.fromJson(json["series"]),
      json["id"],
      number: int.parse(json["number"].toString()),
      name: json["title"],
      imageUrl: json["image"],
      reprints: (json["reprints"] as List<dynamic>).map((reprint) => Reprint.fromJson(reprint)).toList()
    );
  }

}