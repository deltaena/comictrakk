// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_dao.dart';

// ignore_for_file: type=lint
mixin _$IssueDaoMixin on DatabaseAccessor<AppDatabase> {
  $SeriesTypeTable get seriesType => attachedDatabase.seriesType;
  $SeriesTTable get seriesT => attachedDatabase.seriesT;
  $IssuesTable get issues => attachedDatabase.issues;
  $IssueDetailsTable get issueDetails => attachedDatabase.issueDetails;
  $TrackersTable get trackers => attachedDatabase.trackers;
  IssueDaoManager get managers => IssueDaoManager(this);
}

class IssueDaoManager {
  final _$IssueDaoMixin _db;
  IssueDaoManager(this._db);
  $$SeriesTypeTableTableManager get seriesType =>
      $$SeriesTypeTableTableManager(_db.attachedDatabase, _db.seriesType);
  $$SeriesTTableTableManager get seriesT =>
      $$SeriesTTableTableManager(_db.attachedDatabase, _db.seriesT);
  $$IssuesTableTableManager get issues =>
      $$IssuesTableTableManager(_db.attachedDatabase, _db.issues);
  $$IssueDetailsTableTableManager get issueDetails =>
      $$IssueDetailsTableTableManager(_db.attachedDatabase, _db.issueDetails);
  $$TrackersTableTableManager get trackers =>
      $$TrackersTableTableManager(_db.attachedDatabase, _db.trackers);
}
