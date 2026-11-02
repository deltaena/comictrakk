import 'package:comictrakk/objects/series/series_type.dart';

class SeriesPreview {

  late int id;
  late String name;
  late int volumeNumber;
  late int yearBegan;
  late SeriesType seriesType;

  SeriesPreview({required this.id, required this.name, required this.volumeNumber, required this.yearBegan,
    required this.seriesType});

  factory SeriesPreview.fromJson(Map<String, dynamic> json){
    return SeriesPreview(
      id: json["id"],
      name: json["series"],
      volumeNumber: json["volume"],
      yearBegan: json["year_began"],

      seriesType: SeriesType.fromJson(json["series_type"])
    );
  }
}