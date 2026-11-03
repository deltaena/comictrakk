import 'package:comictrakk/core/enums/track_status.dart';

abstract class Trackable {

  late int id;
  late TrackStatus _trackStatus = TrackStatus.notTracking;

  Trackable(this.id);

  void setTrackStatus(TrackStatus newStatus){ _trackStatus = newStatus; }

  TrackStatus getTrackStatus() { return _trackStatus; }

  Map<String, dynamic> toMap() {
    return {'id': id, 'status': getTrackStatus()};
  }

  void fromMap(Map<String, dynamic> map){
    if(!map.containsKey("id") || !map.containsKey("status")) {
      print("deltalog: error, map doesn't include required fields");
      return;
    }

    int mapId = int.parse(map["id"].toString());

    if(!(mapId != id)){
      print("deltalog: error, map id doesn't match");
      return;
    }

    setTrackStatus(TrackStatus.fromInt(map["status"]));
  }
}