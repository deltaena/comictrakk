class SeriesType {

  int id;
  String name;

  SeriesType({required this.id, required this.name});

  factory SeriesType.fromJson(Map<String, dynamic> json){
    return SeriesType(
      id: json["id"],
      name: json["name"]
    );
  }

  bool get isCollected => (id == 15 || id == 10 || id == 8);
}