import 'package:comictrakk/core/enums/tracking_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group("track status enum tests", () {

    test("Create not tracking", () {
      TrackingStatus status = TrackingStatus.fromInt(0);

      expect(status, TrackingStatus.notTracking);
    });

    test("Create wished", () {
      TrackingStatus status = TrackingStatus.fromInt(1);

      expect(status, TrackingStatus.wish);
    });

    test("Create property", () {
      TrackingStatus status = TrackingStatus.fromInt(2);

      expect(status, TrackingStatus.have);
    });

    test("Create read", () {
      TrackingStatus status = TrackingStatus.fromInt(3);

      expect(status, TrackingStatus.read);
    });

    test("Fail on out of bounds int", () {
      try {
        TrackingStatus.fromInt(4);
      } catch(e){
        expect(e.toString(), "Exception: 4 is not a 0 to 3 int");
      }
    });
  });
}