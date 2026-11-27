enum TrackerStatus {
  wish(1),
  have(2),
  read(3);

  final int value;

  const TrackerStatus(this.value);

  factory TrackerStatus.fromInt(int id) {
    switch (id) {
      case 1:
        return wish;
      case 2:
        return have;
      case 3:
        return read;

      default:
        throw Exception("$num is not a 0 to 3 int");
    }
  }
}
