import 'package:comictrakk/core/database/app_database.dart';
import 'package:drift/drift.dart';

class SeriesMapper {
  SeriesTCompanion fromMap(Map<String, dynamic> map) {
    return SeriesTCompanion.insert(
      id: Value(map["id"] as int),
      name: map["series"],
      volume: map["volume"],
      yearBegan: map["year_began"],
      yearEnd: (map["year_end"] ?? -1) as int,
      issueCount: map["issue_count"],
      seriesTypeId: map["series_type"]["id"],
    );
  }

  SeriesDetailsCompanion detailsFromMap(Map<String, dynamic> map) {
    return SeriesDetailsCompanion.insert(
        id: Value(map["id"] as int),
        description: map["desc"]
    );
  }
}
