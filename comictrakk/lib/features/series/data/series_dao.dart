import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/item_search/searches.dart';
import 'package:comictrakk/features/search_results/search_results.dart';
import 'package:comictrakk/features/series/models/series_merger.dart';
import 'package:drift/drift.dart';

import '../series.dart';
import '../series_details.dart';

part 'series_dao.g.dart';

@DriftAccessor(tables: [SeriesT, SeriesDetails, Searches, SearchResults])
class SeriesDao extends DatabaseAccessor<AppDatabase> with _$SeriesDaoMixin {
  final DateTime dateNow = DateTime.now();

  SeriesDao(super.db);

  Stream<List<SeriesMerger>> watchSeriesById(int seriesId) {
    return (select(seriesT)..where((series) => series.id.equals(seriesId)))
        .join([
          fullOuterJoin(seriesDetails, seriesDetails.id.equalsExp(seriesT.id)),
        ])
        .map(
          (row) => SeriesMerger(
            series: row.readTable(seriesT),
            details: row.readTableOrNull(seriesDetails),
          ),
        )
        .watch();
  }

  Stream<List<SeriesMerger>> watchLastSearchedSeries() {
    final lastSearch = Subquery(
      select(searches)
        ..where((search) => search.searchedAt.isBiggerThanValue(dateNow))
        ..orderBy([
          (search) => OrderingTerm(
            expression: search.searchedAt,
            mode: OrderingMode.desc,
          ),
        ])
        ..limit(1),
      "last_search",
    );

    return select(lastSearch)
        .join([
          innerJoin(
            searchResults,
            searchResults.search.equalsExp(lastSearch.ref(searches.query)),
          ),
          innerJoin(seriesT, seriesT.id.equalsExp(searchResults.seriesId)),
        ])
        .map((row) => SeriesMerger(series: row.readTable(seriesT)))
        .watch();
  }

  Future<void> cacheSeriesList(List<SeriesTCompanion> companions) async {
    await batch((batch) {
      batch.insertAll(seriesT, companions, mode: InsertMode.insertOrReplace);
    });
  }

  Future<void> cacheDetailsList(List<SeriesDetailsCompanion> companions) async {
    await batch((batch) {
      batch.insertAll(
        seriesDetails,
        companions,
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<void> cacheSeries(SeriesTCompanion companion) async =>
      await into(seriesT).insertOnConflictUpdate(companion);

  Future<void> cacheDetail(SeriesDetailsCompanion companion) async =>
      await into(seriesDetails).insertOnConflictUpdate(companion);
}
