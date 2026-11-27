import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/item_search/searches.dart';
import 'package:comictrakk/features/series/series.dart';
import 'package:drift/drift.dart';

part 'search_dao.g.dart';

@DriftAccessor(tables: [Searches, SeriesT])
class SearchDao extends DatabaseAccessor<AppDatabase> with _$SearchDaoMixin {
  final DateTime dateNow = DateTime.now();

  new(super.attachedDatabase);

  Stream<List<String>> watchUniqueSearches() {
    final latestSearch = searches.searchedAt.max();

    return (selectOnly(searches)
          ..addColumns([searches.query, latestSearch])
          ..groupBy([searches.query])
          ..orderBy([OrderingTerm.desc(latestSearch)]))
        .map((row) => row.read(searches.query)!)
        .watch();
  }

  Stream<Search?> watchLastSearch() {
    return (select(searches)
          ..where((search) => search.searchedAt.isBiggerThanValue(dateNow))
          ..orderBy([
            (search) => OrderingTerm(
              expression: search.searchedAt,
              mode: OrderingMode.desc,
            ),
          ])
          ..limit(1))
        .watchSingleOrNull();
  }

  Future<void> addSearch(SearchesCompanion search) async =>
      into(searches).insertOnConflictUpdate(search);

  Future<void> updateSearch(
    String query,
    SearchesCompanion updatedSearch,
  ) async => (update(
    searches,
  )..where((search) => search.query.equals((query)))).write(updatedSearch);

  Future<bool> searchExists(String query) async => (await (select(
    searches,
  )..where((search) => search.query.equals((query)))).get()).isNotEmpty;
}
