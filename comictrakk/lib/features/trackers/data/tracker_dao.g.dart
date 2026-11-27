// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracker_dao.dart';

// ignore_for_file: type=lint
mixin _$TrackerDaoMixin on DatabaseAccessor<AppDatabase> {
  $SeriesTypeTable get seriesType => attachedDatabase.seriesType;
  $SeriesTTable get seriesT => attachedDatabase.seriesT;
  $IssuesTable get issues => attachedDatabase.issues;
  $TrackersTable get trackers => attachedDatabase.trackers;
  TrackerDaoManager get managers => TrackerDaoManager(this);
}

class TrackerDaoManager {
  final _$TrackerDaoMixin _db;
  TrackerDaoManager(this._db);
  $$SeriesTypeTableTableManager get seriesType =>
      $$SeriesTypeTableTableManager(_db.attachedDatabase, _db.seriesType);
  $$SeriesTTableTableManager get seriesT =>
      $$SeriesTTableTableManager(_db.attachedDatabase, _db.seriesT);
  $$IssuesTableTableManager get issues =>
      $$IssuesTableTableManager(_db.attachedDatabase, _db.issues);
  $$TrackersTableTableManager get trackers =>
      $$TrackersTableTableManager(_db.attachedDatabase, _db.trackers);
}
