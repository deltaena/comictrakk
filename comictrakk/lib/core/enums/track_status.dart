enum ComicStatus {
  notTracking(0),
  wished(1),
  haveIt(2),
  read(3);

  final int value;

  const ComicStatus(this.value);

  factory ComicStatus.fromInt(int num){
    switch (num) {
      case 0:
        return notTracking;
      case 1:
        return wished;
      case 2:
        return haveIt;
      case 3:
        return read;

      default:
          throw Exception("$num is not a 0 to 3 int");
    }
  }
}