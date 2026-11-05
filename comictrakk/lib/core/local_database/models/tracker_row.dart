class TrackerRow {
  int id;
  int status;

  TrackerRow({required this.id, required this.status});

  factory TrackerRow.fromJson(Map<String, Object?> row) {
    return TrackerRow(
        id: int.parse(row["id"].toString()),
        status: int.parse(row["status"].toString()),
    );
  }
}