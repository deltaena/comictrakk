import 'package:comictrakk/core/models/trackable/trackable.dart';

class Reprint extends Trackable {
  late String name;

  Reprint({required super.id, required this.name});

  factory Reprint.fromJson(Map<String, dynamic> map) {
    return Reprint(
        id: map["id"],
        name: map["issue"]
    );
  }
}