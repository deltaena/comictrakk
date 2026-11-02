class BaseSeries {

  late int id;
  late String name;
  late int volumeNumber;
  late int yearBegan;

  BaseSeries({required this.id, required this.name, required this.volumeNumber, required this.yearBegan});

  factory BaseSeries.fromJson(Map<String, dynamic> json){
    return BaseSeries(
        id: json["id"],
        name: json["name"],
        volumeNumber: json["volume"],
        yearBegan: json["year_began"],
    );
  }

}