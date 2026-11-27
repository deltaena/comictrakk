import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/search_results/search_results.dart';
import 'package:comictrakk/features/series/series.dart';
import 'package:drift/drift.dart';

part 'search_result_dao.g.dart';

@DriftAccessor(tables: [SearchResults, SeriesT])
class SearchResultDao extends DatabaseAccessor<AppDatabase> with _$SearchResultDaoMixin {
  new(super.attachedDatabase);

  Future<void> insertResults(List<SearchResultsCompanion> companions) async {
    batch((batch) {
      batch.insertAll(searchResults, companions, mode: InsertMode.insertOrReplace);
    });
  }

}