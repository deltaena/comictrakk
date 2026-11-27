import 'package:comictrakk/features/issues/issues.dart';
import 'package:comictrakk/features/trackers/constants/tracker_status.dart';
import 'package:drift/drift.dart';

class Trackers extends Table {
  @ReferenceName('issueId')
  IntColumn get issueId => integer().references(Issues, #id)();

  @ReferenceName('parentIssueId')
  IntColumn get parentIssueId => integer().references(Issues, #id).nullable()();

  IntColumn get status => intEnum<TrackerStatus>()();

  @override
  Set<Column> get primaryKey => { issueId, status };
}