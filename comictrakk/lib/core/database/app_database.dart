import 'package:comictrakk/features/issues/issue_details.dart';
import 'package:comictrakk/core/database/tables/issue_series.dart';
import 'package:comictrakk/features/reprints/data/reprints_dao.dart';
import 'package:comictrakk/features/reprints/reprints.dart';
import 'package:comictrakk/features/search_results/data/search_result_dao.dart';
import 'package:comictrakk/features/search_results/search_results.dart';
import 'package:comictrakk/features/series/series_details.dart';
import 'package:comictrakk/features/series/series_type.dart';
import 'package:comictrakk/features/issues/issues.dart';
import 'package:comictrakk/features/issues/data/issue_dao.dart';
import 'package:comictrakk/features/item_search/data/search_dao.dart';
import 'package:comictrakk/features/item_search/searches.dart';
import 'package:comictrakk/features/series/data/series_dao.dart';
import 'package:comictrakk/features/series/series.dart';
import 'package:comictrakk/features/trackers/constants/tracker_status.dart';
import 'package:comictrakk/features/trackers/data/tracker_dao.dart';
import 'package:comictrakk/features/trackers/trackers.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Issues,
    IssueDetails,
    IssueSeries,
    Reprints,
    SeriesT,
    SeriesDetails,
    SeriesType,
    Trackers,
    Searches,
    SearchResults
  ],
  daos: [
    IssueDao,
    SeriesDao,
    TrackerDao,
    SearchDao,
    SearchResultDao,
    ReprintDao
  ],
)
class AppDatabase extends _$AppDatabase {

  AppDatabase(super.executor);

  AppDatabase.defaults() : super(_openConnection());

  @override
  int get schemaVersion => 1; // Increment this whenever you alter tables in the future

  // Configures the local SQLite file connection using drift_flutter
  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'comictrakk_db');
  }
}
