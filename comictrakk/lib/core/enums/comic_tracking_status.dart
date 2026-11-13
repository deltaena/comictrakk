enum ComicTrackingStatus {
  notTracking(0),
  wished(1),
  have(2),
  read(3);

  final int value;

  const ComicTrackingStatus(this.value);

  factory ComicTrackingStatus.fromInt(int num){
    switch (num) {
      case 0:
        return notTracking;
      case 1:
        return wished;
      case 2:
        return have;
      case 3:
        return read;

      default:
          throw Exception("$num is not a 0 to 3 int");
    }
  }
}