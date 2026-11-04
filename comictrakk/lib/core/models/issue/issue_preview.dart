import 'package:comictrakk/core/models/trackable/trackable.dart';

class IssuePreview extends Trackable {

  int number;
  String name;
  String imageUrl;

  IssuePreview({required super.id, required this.number, required this.name,
    required this.imageUrl});

  factory IssuePreview.fromJson(Map<String, dynamic> json){
    return IssuePreview(
      id: json["id"],
      number: int.parse(json["number"].toString()),
      name: json["issue"],
      imageUrl: json["image"],
    );
  }

}