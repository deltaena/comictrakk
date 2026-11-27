import 'package:comictrakk/core/database/app_database.dart';

class SeriesMerger {

  final Series series;
  final SeriesDetail? details;

  bool get hasDetails => details != null;

  SeriesMerger({required this.series, this.details});
}