import 'package:comictrakk/core/models/trackable/trackable.dart';

class IssuePreview extends Trackable {

  double number;
  String name;
  String imageUrl;

  IssuePreview({required super.id, required this.number, required this.name,
    required this.imageUrl});

  factory IssuePreview.fromJson(Map<String, dynamic> json){
    String issueNumberStr = json["number"].toString();

    double issueNumber = double.negativeInfinity;

    switch(issueNumberStr){
      case "½":
        issueNumber = 0.5;
        break;

      default:
        double.parse(issueNumberStr);
    }

    return IssuePreview(
      id: json["id"],
      number: issueNumber,
      name: json["issue"],
      imageUrl: json["image"],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is IssuePreview && runtimeType == other.runtimeType &&
              id == other.id && number == other.number && name == other.name;

  @override
  int get hashCode => Object.hash(number, name);


}