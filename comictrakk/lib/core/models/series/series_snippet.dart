class SeriesSnippet {

  late int id;
  late String name;
  late int volumeNumber;
  late int yearBegan;

  SeriesSnippet({required this.id, required this.name, required this.volumeNumber, required this.yearBegan});

  factory SeriesSnippet.fromJson(Map<String, dynamic> json){
    return SeriesSnippet(
        id: json["id"],
        name: json["name"],
        volumeNumber: json["volume"],
        yearBegan: json["year_began"],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SeriesSnippet && runtimeType == other.runtimeType &&
              id == other.id && name == other.name &&
              volumeNumber == other.volumeNumber &&
              yearBegan == other.yearBegan;

  @override
  int get hashCode => Object.hash(id, name, volumeNumber, yearBegan);
}