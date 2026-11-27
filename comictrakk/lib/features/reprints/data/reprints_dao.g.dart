// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reprints_dao.dart';

// ignore_for_file: type=lint
mixin _$ReprintDaoMixin on DatabaseAccessor<AppDatabase> {
  $SeriesTypeTable get seriesType => attachedDatabase.seriesType;
  $SeriesTTable get seriesT => attachedDatabase.seriesT;
  $IssuesTable get issues => attachedDatabase.issues;
  $ReprintsTable get reprints => attachedDatabase.reprints;
  ReprintDaoManager get managers => ReprintDaoManager(this);
}

class ReprintDaoManager {
  final _$ReprintDaoMixin _db;
  ReprintDaoManager(this._db);
  $$SeriesTypeTableTableManager get seriesType =>
      $$SeriesTypeTableTableManager(_db.attachedDatabase, _db.seriesType);
  $$SeriesTTableTableManager get seriesT =>
      $$SeriesTTableTableManager(_db.attachedDatabase, _db.seriesT);
  $$IssuesTableTableManager get issues =>
      $$IssuesTableTableManager(_db.attachedDatabase, _db.issues);
  $$ReprintsTableTableManager get reprints =>
      $$ReprintsTableTableManager(_db.attachedDatabase, _db.reprints);
}
