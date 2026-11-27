import 'package:comictrakk/core/database/app_database.dart';

extension SeriesExtension on Series {
  //TODO annual is or not?
  bool get isCollected => seriesTypeId == 8 || seriesTypeId == 15 || seriesTypeId == 10;
}