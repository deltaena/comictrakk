import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/issues/models/issue_row_merger.dart';
import 'package:comictrakk/features/trackers/models/tracker_merger.dart';
import 'package:comictrakk/features/trackers/trackers.dart';
import 'package:drift/drift.dart';

import '../issue_details.dart';
import '../issues.dart';

part 'issue_dao.g.dart';

@DriftAccessor(tables: [Issues, IssueDetails, Trackers])
class IssueDao extends DatabaseAccessor<AppDatabase> with _$IssueDaoMixin {
  IssueDao(super.db);

  Stream<List<IssueRowMerger>> watchIssuesById(int issueId) =>
      _watchIssuesWhere(issues.id.equals(issueId));

  Stream<List<IssueRowMerger>> watchIssuesInSeries(int seriesId) =>
      _watchIssuesWhere(issues.seriesId.equals(seriesId));

  Stream<List<IssueRowMerger>> _watchIssuesWhere(Expression<bool> predicate) {
    final parentIssues = alias(issues, "parentIssues");

    return (select(issues).join([
      leftOuterJoin(trackers, trackers.issueId.equalsExp(issues.id)),
      leftOuterJoin(parentIssues, parentIssues.id.equalsExp(trackers.parentIssueId)),
    ])..where(predicate)).map((row) {
      final issue = row.readTable(issues);
      final tracker = row.readTableOrNull(trackers);
      final parentIssue = row.readTableOrNull(parentIssues);

      if (tracker != null) {
        final trackerMerger = TrackerMerger(
          tracker: row.readTable(trackers),
          parentIssue: parentIssue,
        );

        return IssueRowMerger(issue: issue, tracker: trackerMerger);
      }

      return IssueRowMerger(issue: issue);
    }).watch();
  }

  Future<List<Issue>> getIssuesInSeries(int seriesId) =>
      (select(issues)..where((issue) => issue.seriesId.equals(seriesId))).get();

  Future<List<IssueDetail>> getIssueDetails(int issueId) => (select(
    issueDetails,
  )..where((details) => details.id.equals(issueId))).get();

  Future<void> cacheIssues(List<IssuesCompanion> companions) async {
    batch((batch) {
      batch.insertAll(issues, companions, mode: InsertMode.insertOrReplace);
    });
  }

  Future<void> cacheIssue(IssuesCompanion companion) async {
    await into(issues).insertOnConflictUpdate(companion);
  }

  Future<void> cacheIssueDetail(IssueDetailsCompanion companion) async {
    await into(issueDetails).insertOnConflictUpdate(companion);
  }
}
