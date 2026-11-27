// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_dao.dart';

// ignore_for_file: type=lint
mixin _$SearchDaoMixin on DatabaseAccessor<AppDatabase> {
  $SearchesTable get searches => attachedDatabase.searches;
  $SeriesTypeTable get seriesType => attachedDatabase.seriesType;
  $SeriesTTable get seriesT => attachedDatabase.seriesT;
  SearchDaoManager get managers => SearchDaoManager(this);
}

class SearchDaoManager {
  final _$SearchDaoMixin _db;
  SearchDaoManager(this._db);
  $$SearchesTableTableManager get searches =>
      $$SearchesTableTableManager(_db.attachedDatabase, _db.searches);
  $$SeriesTypeTableTableManager get seriesType =>
      $$SeriesTypeTableTableManager(_db.attachedDatabase, _db.seriesType);
  $$SeriesTTableTableManager get seriesT =>
      $$SeriesTTableTableManager(_db.attachedDatabase, _db.seriesT);
}
