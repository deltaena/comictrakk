import 'package:comictrakk/objects/Series/pojos/series_detail.dart';
import 'package:comictrakk/objects/Trackable/trackable.dart';

class IssuePreview extends Trackable {

  final SeriesDetail seriesDetail;

  int number;
  String name;
  String imageUrl;

  IssuePreview(super.id, {required this.seriesDetail, required this.number, required this.name,
    required this.imageUrl});

  factory IssuePreview.fromJson(SeriesDetail seriesDetail, Map<String, dynamic> json){
    return IssuePreview(
      seriesDetail: seriesDetail,
      json["id"],
      number: int.parse(json["number"].toString()),
      name: json["issue"],
      imageUrl: json["image"]
    );
  }

}