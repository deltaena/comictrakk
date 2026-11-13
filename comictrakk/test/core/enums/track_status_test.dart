import 'package:comictrakk/core/enums/comic_tracking_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group("track status enum tests", () {

    test("Create not tracking", () {
      ComicTrackingStatus status = ComicTrackingStatus.fromInt(0);

      expect(status, ComicTrackingStatus.notTracking);
    });

    test("Create wished", () {
      ComicTrackingStatus status = ComicTrackingStatus.fromInt(1);

      expect(status, ComicTrackingStatus.wished);
    });

    test("Create property", () {
      ComicTrackingStatus status = ComicTrackingStatus.fromInt(2);

      expect(status, ComicTrackingStatus.have);
    });

    test("Create read", () {
      ComicTrackingStatus status = ComicTrackingStatus.fromInt(3);

      expect(status, ComicTrackingStatus.read);
    });

    test("Fail on out of bounds int", () {
      try {
        ComicTrackingStatus.fromInt(4);
      } catch(e){
        expect(e.toString(), "Exception: 4 is not a 0 to 3 int");
      }
    });
  });
}