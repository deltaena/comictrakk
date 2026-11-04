import 'package:comictrakk/core/enums/track_status.dart';
import 'package:comictrakk/core/models/series/series_snippet.dart';

abstract class Trackable {

  late int id;
  late SeriesSnippet series;
  late ComicStatus _comicStatus;

  Trackable({required this.id, this._comicStatus = ComicStatus.notTracking});

  void setComicStatus(ComicStatus newStatus){
    if(_comicStatus.value == newStatus.value) return;

    _comicStatus = newStatus;
  }
  ComicStatus getComicStatus() { return _comicStatus; }
}