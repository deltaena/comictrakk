// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_dao.dart';

// ignore_for_file: type=lint
mixin _$SearchResultDaoMixin on DatabaseAccessor<AppDatabase> {
  $SearchesTable get searches => attachedDatabase.searches;
  $SeriesTypeTable get seriesType => attachedDatabase.seriesType;
  $SeriesTTable get seriesT => attachedDatabase.seriesT;
  $SearchResultsTable get searchResults => attachedDatabase.searchResults;
  SearchResultDaoManager get managers => SearchResultDaoManager(this);
}

class SearchResultDaoManager {
  final _$SearchResultDaoMixin _db;
  SearchResultDaoManager(this._db);
  $$SearchesTableTableManager get searches =>
      $$SearchesTableTableManager(_db.attachedDatabase, _db.searches);
  $$SeriesTypeTableTableManager get seriesType =>
      $$SeriesTypeTableTableManager(_db.attachedDatabase, _db.seriesType);
  $$SeriesTTableTableManager get seriesT =>
      $$SeriesTTableTableManager(_db.attachedDatabase, _db.seriesT);
  $$SearchResultsTableTableManager get searchResults =>
      $$SearchResultsTableTableManager(_db.attachedDatabase, _db.searchResults);
}
