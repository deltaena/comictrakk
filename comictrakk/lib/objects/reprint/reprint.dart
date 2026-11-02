class Reprint {
  late int id;
  late String name;

  Reprint({required this.id, required this.name});

  factory Reprint.fromJson(Map<String, dynamic> map) {
    return Reprint(
        id: map["id"],
        name: map["issue"]
    );
  }
}