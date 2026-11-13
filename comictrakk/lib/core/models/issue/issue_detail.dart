import 'package:comictrakk/core/models/issue/issue_preview.dart';
import 'package:comictrakk/core/models/reprint/reprint.dart';

class IssueDetail extends IssuePreview {

  late List<Reprint> reprints;

  new({required super.id, required super.number, required super.name, required super.imageUrl,
    required this.reprints});

  factory IssueDetail.fromJson(Map<String, dynamic> json){
    String issueNumberStr = json["number"].toString();

    double issueNumber = double.negativeInfinity;

    switch(issueNumberStr){
      case "½":
        issueNumber = 0.5;
        break;

      default:
        double.parse(issueNumberStr);
    }

    return IssueDetail(
      id: json["id"],
      number: issueNumber,
      name: json["title"],
      imageUrl: json["image"],
      reprints: (json["reprints"] as List<dynamic>).map((reprint) => Reprint.fromJson(reprint)).toList()
    );
  }

}