import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/issues/issues.dart';
import 'package:comictrakk/features/trackers/constants/tracker_status.dart';
import 'package:comictrakk/features/trackers/models/tracker_merger.dart';
import 'package:comictrakk/features/trackers/trackers.dart';
import 'package:drift/drift.dart';

part 'tracker_dao.g.dart';

@DriftAccessor(tables: [Trackers, Issues])
class TrackerDao extends DatabaseAccessor<AppDatabase> with _$TrackerDaoMixin {
  TrackerDao(super.db);

  Future<List<Tracker>> getAllTrackers() async => await select(trackers).get();

  Stream<List<TrackerMerger>> watchAllTrackers() {
    final parentIssues = alias(issues, "parentIssues");

    return select(trackers)
        .join([
          leftOuterJoin(
            parentIssues,
            parentIssues.id.equalsExp(trackers.parentIssueId),
          ),
        ])
        .map(
          (row) => TrackerMerger(
            tracker: row.readTable(trackers),
            parentIssue: row.readTableOrNull(parentIssues),
          ),
        )
        .watch();
  }

  Stream<List<TrackerMerger>> watchTrackersBySeries(int seriesId) {
    final parentIssues = alias(issues, "parentIssues");

    Subquery<Issue> seriesIssues = Subquery(
      select(issues)..where((issue) => issue.seriesId.equals(seriesId)),
      "series_issues",
    );

    return select(trackers)
        .join([
          innerJoin(
            seriesIssues,
            seriesIssues.ref(issues.id).equalsExp(trackers.issueId),
          ),
          leftOuterJoin(
            parentIssues,
            parentIssues.id.equalsExp(trackers.parentIssueId),
          ),
        ])
        .map(
          (row) => TrackerMerger(
            tracker: row.readTable(trackers),
            parentIssue: row.readTableOrNull(parentIssues),
          ),
        )
        .watch();
  }

  Future<List<Tracker>> getIssueTrackers(int issueId) async => await (select(
    trackers,
  )..where((tracker) => tracker.issueId.equals(issueId))).get();

  Future<bool> trackerExists(int issueId, TrackerStatus status) async {
    final result =
        await (select(trackers)..where(
              (tracker) =>
                  tracker.issueId.equals(issueId) &
                  tracker.status.equalsValue(status),
            ))
            .get();

    return result.isNotEmpty;
  }

  Future<List<Tracker>> getTrackersInIssues(Iterable<int> issueIds) {
    return (select(trackers)..where((tbl) => tbl.issueId.isIn(issueIds))).get();
  }

  Future<void> insertMultiple(List<TrackersCompanion> companions) async {
    await batch((batch) {
      batch.insertAll(trackers, companions, mode: InsertMode.insertOrReplace);
    });
  }

  Future<void> updateMultiple(List<TrackersCompanion> companions) async {
    await batch((batch) {
      batch.replaceAll(trackers, companions);
    });
  }

  Future<void> deleteMultiple(List<TrackersCompanion> deleteTrackers) async {
    await batch((batch) {
      for (final tracker in deleteTrackers) {
        batch.delete(trackers, tracker);
      }
    });
  }

  Future<void> insertTracker(TrackersCompanion tracker) async =>
      await into(trackers).insert(tracker);

  Future<void> updateTracker(TrackersCompanion tracker) async =>
      await update(trackers).replace(tracker);

  Future<int> deleteTracker(TrackersCompanion tracker) async =>
      await delete(trackers).delete(tracker);
}
