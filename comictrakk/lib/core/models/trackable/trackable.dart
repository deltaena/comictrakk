import 'package:comictrakk/core/enums/comic_tracking_status.dart';
import 'package:comictrakk/core/models/series/series_snippet.dart';

abstract class Trackable {

  late int id;
  late SeriesSnippet series;
  late ComicTrackingStatus _comicStatus;

  Trackable({required this.id, this._comicStatus = ComicTrackingStatus.notTracking});

  void setComicStatus(ComicTrackingStatus newStatus){
    if(_comicStatus.value == newStatus.value) return;

    _comicStatus = newStatus;
  }
  ComicTrackingStatus getComicStatus() { return _comicStatus; }
}