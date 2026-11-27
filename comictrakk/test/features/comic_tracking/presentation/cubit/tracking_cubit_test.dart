import 'dart:io';

import 'package:comictrakk/core/enums/tracking_status.dart';
import 'package:comictrakk/core/local_database/models/tracker_row.dart';
import 'package:comictrakk/core/local_database/sqlite_client.dart';
import 'package:comictrakk/core/models/issues/issue_detail.dart';
import 'package:comictrakk/core/models/issues/issue_preview.dart';
import 'package:comictrakk/core/models/series/series_preview.dart';
import 'package:comictrakk/core/models/trackers/trackers.dart';
import 'package:comictrakk/features/comic_tracking/presentation/tracking_cubit.dart';
import 'package:comictrakk/features/comic_tracking/presentation/tracking_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_common_ffi.dart';

import '../../../../core/constants/mock_models.dart';
import '../../../../core/local_database/mock_sqlite_service.dart';
import '../../../../core/network/mock_comic_api_client.dart';

void main() {
  sqfliteFfiInit();

  late TrackingCubit trackingCubit;
  MockComicApiClient mockApi = MockComicApiClient();

  Future<void> closeDatabase() async {
    await SqliteClient().trackerServ.closeDatabase();
  }
  Future<void> insertInitialMockDbData() async {
    List<IssuePreview> issues = MockModels().mockTrackedIssues;

    int wishIndex = issues.indexWhere((issue) => issue.id == 1);
    issues[wishIndex].setComicStatus(TrackingStatus.wish);

    int haveIndex = issues.indexWhere((issue) => issue.id == 2);
    issues[haveIndex].setComicStatus(TrackingStatus.have);

    int readIndex = issues.indexWhere((issue) => issue.id == 3);
    issues[readIndex].setComicStatus(TrackingStatus.read);

    await SqliteClient().upsertTrackers(issues);

    List<TrackerRow> rows = await SqliteClient().getAllTrackers();
    expect(rows.length, 3);
  }
  Future<void> clearDatabase() async {
    bool cleared = await SqliteClient().trackerServ.deleteAllTrackers();

    expect(cleared, true);
  }

  setUpAll(() async {
    databaseFactory = databaseFactoryFfi;

    String dbPath = join(await getDatabasesPath(), "comictrakk.db");
    File dbFile = File(dbPath);

    if(await dbFile.exists()) dbFile.delete();
  });

  group("TrackingCubit load initial data", () {
    //region setup // teardown
    setUpAll(() async {
      await clearDatabase();
      await insertInitialMockDbData();
    });

    setUp(() => trackingCubit = TrackingCubit(mockApi: mockApi));
    tearDown(() => trackingCubit.close());
    tearDownAll(() async => {
      await closeDatabase()
    });
    //endregion

    test("test initial loading initial statuses", () async {
      mockApi.testBehaviour = "wait";

      List<IssuePreview> issues = MockModels().mockTrackedIssues;

      final loading = trackingCubit.loadInitialStatuses(issues);

      expect(trackingCubit.state, isA<TrackingLoading>());

      await loading;

      expect(trackingCubit.state, isA<TrackingLoaded>());

      TrackingLoaded loadedStatus = trackingCubit.state as TrackingLoaded;
      List<Tracker> trackables = loadedStatus.issues;

      expect(trackables.length, 4);

      Tracker zero = trackables.firstWhere((track) => track.id == 0);
      Tracker one = trackables.firstWhere((track) => track.id == 1);
      Tracker two = trackables.firstWhere((track) => track.id == 2);
      Tracker three = trackables.firstWhere((track) => track.id == 3);

      expect(zero.getComicStatus().value, TrackingStatus.notTracking.value);
      expect(one.getComicStatus().value, TrackingStatus.wish.value);
      expect(two.getComicStatus().value, TrackingStatus.have.value);
      expect(three.getComicStatus().value, TrackingStatus.read.value);
    });
  });

  group("update single status", () {

    //region setup//teardown
    setUpAll(() async {
      await clearDatabase();
      await insertInitialMockDbData();
    });

    setUp(() => trackingCubit = TrackingCubit(mockApi: mockApi));
    tearDown(() => trackingCubit.close());
    //endregion

    test("update each issues to next status", () async {
      List<IssuePreview> issues = MockModels().mockTrackedIssues;

      for (IssuePreview issue in issues) {
        int id = issue.id;
        int newStatusId = (id + 1) % 4;

        TrackingStatus newStatus = TrackingStatus.fromInt(
            newStatusId);

        await trackingCubit.updateTrackingStatus(issue, newStatus);

        //test status return
        expect(trackingCubit.state, isA<TrackingUpdated>());

        TrackingUpdated updatedState = trackingCubit.state as TrackingUpdated;

        expect(updatedState.issues.length, 1);
        expect(updatedState.issues[0]
            .getComicStatus()
            .value, newStatus.value);
      }

      //test what's in db
      List<TrackerRow> rows = await SqliteClient().getTrackers(issues);

      expect(rows.length, 3);
      expect(rows.where((row) => row.id == 3).toList().length, 0);

      for (TrackerRow tracker in rows) {
        expect(rows.firstWhere((row) => row.id == tracker.id).status, tracker.id + 1);
      }
    });
  });

  group("propagation test", () {
    //region setup//teardown
    setUp(() async {
      await clearDatabase();
      await insertInitialMockDbData();

      trackingCubit = TrackingCubit(mockApi: mockApi);
    });
    tearDown(() => trackingCubit.close());
    //endregion

    Future<void> testPropagationEmit(IssueDetail detail, TrackingStatus newStatus) async {
      await trackingCubit.updateTrackingStatus(detail, newStatus, true);

      expect(trackingCubit.state, isA<TrackingUpdated>());

      TrackingUpdated updatedStatus = trackingCubit.state as TrackingUpdated;

      expect(updatedStatus.issues.length, 1);

      expect(updatedStatus.issues[0].id, detail.id);
      expect(updatedStatus.issues[0].getComicStatus().value, newStatus.value);
    }

    Future<void> testPropagationSql(int expectedLength, TrackingStatus expectedStatus) async {
      List<TrackerRow> rows = await SqliteClient().getAllTrackers();

      expect(rows.length, expectedLength);

      for(TrackerRow row in rows){
        expect(row.status, expectedStatus.value);
      }
    }

    test("parent insert (not to any)", () async {
      IssueDetail detail = MockModels().mockIssueDetail;

      TrackingStatus newStatus = TrackingStatus.have;

      await testPropagationEmit(detail, newStatus);
      await testPropagationSql(5, newStatus);
    });

    test("parent update (any to any)", () async {
      IssueDetail detail = MockModels().mockIssueDetail;
      detail.setComicStatus(TrackingStatus.wish);

      TrackingStatus newStatus = TrackingStatus.read;

      await testPropagationEmit(detail, newStatus);
      await testPropagationSql(5, newStatus);
    });

    test("parent delete (any to not)", () async {
      IssueDetail detail = MockModels().mockIssueDetail;
      detail.setComicStatus(TrackingStatus.have);

      TrackingStatus newStatus = TrackingStatus.notTracking;

      await testPropagationEmit(detail, newStatus);
      await testPropagationSql(0, newStatus);
    });

    test("on load error return empty list", () async {
      MockSqliteService mockDb = MockSqliteService();
      mockDb.fail = true;

      TrackingCubit mockCubit = TrackingCubit(mockApi: mockApi, mockDb: mockDb);

      List<IssuePreview> issues = MockModels().mockTrackedIssues;

      await mockCubit.loadInitialStatuses(issues);

      expect(mockCubit.state, isA<TrackingError>());

      TrackingError errorState = mockCubit.state as TrackingError;

      expect(errorState.issues.isEmpty, true);
      expect(errorState.message, "Failed to get initial statuses");
    });

    test("on update single error return trackingError", () async {
      MockSqliteService mockDb = MockSqliteService();
      mockDb.fail = true;

      TrackingCubit mockCubit = TrackingCubit(mockApi: mockApi, mockDb: mockDb);

      List<IssuePreview> issues = MockModels().mockTrackedIssues;

      await mockCubit.updateTrackingStatus(issues[0], TrackingStatus.notTracking);

      expect(mockCubit.state, isA<TrackingError>());

      TrackingError errorState = mockCubit.state as TrackingError;

      expect(errorState.issues.isEmpty, true);
      expect(errorState.message, "Failed to update tracking status");
    });

    test("on update propagated error return trackingError", () async {
      MockSqliteService mockDb = MockSqliteService();

      TrackingCubit mockCubit = TrackingCubit(mockApi: mockApi, mockDb: mockDb);

      List<IssuePreview> issues = MockModels().mockTrackedIssues;

      await mockCubit.updateTrackingStatus(issues[0], TrackingStatus.notTracking, true);

      expect(mockCubit.state, isA<TrackingError>());

      TrackingError errorState = mockCubit.state as TrackingError;

      expect(errorState.issues.isEmpty, true);
      expect(errorState.message, "Failed to propagate status");
    });

    test("track only when series is collected", () async {
      List<SeriesPreview> seriesWithTypes = await MockModels().mockSeriesPreviewAllTypes;

      Map<int, bool> map = {};

      for(SeriesPreview series in seriesWithTypes){
        int seriesTypeId = series.seriesType.id;

        if(seriesTypeId == 8 || seriesTypeId == 15 || seriesTypeId == 10){
          map[seriesTypeId] = true;
        } else {
          map[seriesTypeId] = false;
        }
      }

      for(SeriesPreview series in seriesWithTypes){
        int seriesTypeId = series.seriesType.id;

        if(series.seriesType.isCollected){
          expect(map[seriesTypeId], true);
        } else {
          expect(map[seriesTypeId], false);
        }
      }
    });
  });
}















