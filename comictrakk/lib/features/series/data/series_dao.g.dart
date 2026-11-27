// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_dao.dart';

// ignore_for_file: type=lint
mixin _$SeriesDaoMixin on DatabaseAccessor<AppDatabase> {
  $SeriesTypeTable get seriesType => attachedDatabase.seriesType;
  $SeriesTTable get seriesT => attachedDatabase.seriesT;
  $SeriesDetailsTable get seriesDetails => attachedDatabase.seriesDetails;
  $SearchesTable get searches => attachedDatabase.searches;
  $SearchResultsTable get searchResults => attachedDatabase.searchResults;
  SeriesDaoManager get managers => SeriesDaoManager(this);
}

class SeriesDaoManager {
  final _$SeriesDaoMixin _db;
  SeriesDaoManager(this._db);
  $$SeriesTypeTableTableManager get seriesType =>
      $$SeriesTypeTableTableManager(_db.attachedDatabase, _db.seriesType);
  $$SeriesTTableTableManager get seriesT =>
      $$SeriesTTableTableManager(_db.attachedDatabase, _db.seriesT);
  $$SeriesDetailsTableTableManager get seriesDetails =>
      $$SeriesDetailsTableTableManager(_db.attachedDatabase, _db.seriesDetails);
  $$SearchesTableTableManager get searches =>
      $$SearchesTableTableManager(_db.attachedDatabase, _db.searches);
  $$SearchResultsTableTableManager get searchResults =>
      $$SearchResultsTableTableManager(_db.attachedDatabase, _db.searchResults);
}
