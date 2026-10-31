import 'package:comictrakk/objects/Series/pojos/series_detail.dart';

class IssuePreview {

  final SeriesDetail seriesDetail;

  int id;
  int number;
  String name;
  String imageUrl;

  IssuePreview({required this.seriesDetail, required this.id, required this.number, required this.name,
    required this.imageUrl});

  factory IssuePreview.fromJson(SeriesDetail seriesDetail, Map<String, dynamic> json){
    return IssuePreview(
      seriesDetail: seriesDetail,
      id: json["id"],
      number: int.parse(json["number"].toString()),
      name: json["issue"],
      imageUrl: json["image"]
    );
  }
}