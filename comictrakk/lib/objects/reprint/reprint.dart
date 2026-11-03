import 'package:comictrakk/objects/trackable/trackable.dart';

class Reprint extends Trackable {
  late String name;

  Reprint(super.id, {required this.name});

  factory Reprint.fromJson(Map<String, dynamic> map) {
    return Reprint(
        map["id"],
        name: map["issue"]
    );
  }
}