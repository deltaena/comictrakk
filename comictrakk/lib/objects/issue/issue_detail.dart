import 'package:comictrakk/objects/issue/issue_preview.dart';
import 'package:comictrakk/objects/reprint/reprint.dart';

class IssueDetail extends IssuePreview {

  late List<Reprint> reprints;

  new(super.id, {required super.seriesDetail, required super.number, required super.name, required super.imageUrl});



}