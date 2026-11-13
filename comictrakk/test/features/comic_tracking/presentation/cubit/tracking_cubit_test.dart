import 'dart:io';

import 'package:comictrakk/core/enums/comic_tracking_status.dart';
import 'package:comictrakk/core/local_database/models/tracker_row.dart';
import 'package:comictrakk/core/local_database/sqlite_service.dart';
import 'package:comictrakk/core/models/issue/issue_detail.dart';
import 'package:comictrakk/core/models/issue/issue_preview.dart';
import 'package:comictrakk/core/models/series/series_preview.dart';
import 'package:comictrakk/core/models/trackable/trackable.dart';
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
    await SqliteService().trackerServ.closeDatabase();
  }
  Future<void> insertInitialMockDbData() async {
    List<IssuePreview> issues = MockModels().mockTrackedIssues;

    List<IssuePreview> issuesWish = issues
        .where((issue) => issue.id == 1)
        .toList();
    List<IssuePreview> issuesHave = issues
        .where((issue) => issue.id == 2)
        .toList();
    List<IssuePreview> issuesRead = issues
        .where((issue) => issue.id == 3)
        .toList();

    await SqliteService().upsertTrackers(issuesWish, ComicTrackingStatus.wished);
    await SqliteService().upsertTrackers(issuesHave, ComicTrackingStatus.have);
    await SqliteService().upsertTrackers(issuesRead, ComicTrackingStatus.read);


    List<TrackerRow> rows = await SqliteService().getAllTrackers();
    expect(rows.length, 3);
  }
  Future<void> clearDatabase() async {
    bool cleared = await SqliteService().trackerServ.deleteAllTrackers();

    expect(cleared, true);
  }

  setUpAll(() async {
    databaseFactory = databaseFactoryFfi;

    String dbPath = join(await getDatabasesPath(), "comictrakk.db");
    File dbFile = File(dbPath);

    if(await dbFile.exists()) dbFile.delete();

    print("db deleted");
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
      List<Trackable> trackables = loadedStatus.trackables;

      expect(trackables.length, 4);

      Trackable zero = trackables.firstWhere((track) => track.id == 0);
      Trackable one = trackables.firstWhere((track) => track.id == 1);
      Trackable two = trackables.firstWhere((track) => track.id == 2);
      Trackable three = trackables.firstWhere((track) => track.id == 3);

      expect(zero.getComicStatus().value, ComicTrackingStatus.notTracking.value);
      expect(one.getComicStatus().value, ComicTrackingStatus.wished.value);
      expect(two.getComicStatus().value, ComicTrackingStatus.have.value);
      expect(three.getComicStatus().value, ComicTrackingStatus.read.value);
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

    test("update each issue to next status", () async {
      List<IssuePreview> issues = MockModels().mockTrackedIssues;

      for (IssuePreview issue in issues) {
        int id = issue.id;
        int newStatusId = (id + 1) % 4;

        ComicTrackingStatus newStatus = ComicTrackingStatus.fromInt(
            newStatusId);

        await trackingCubit.updateTrackingStatus(issue, newStatus);

        //test status return
        expect(trackingCubit.state, isA<TrackingUpdated>());

        TrackingUpdated updatedState = trackingCubit.state as TrackingUpdated;

        expect(updatedState.trackables.length, 1);
        expect(updatedState.trackables[0]
            .getComicStatus()
            .value, newStatus.value);
      }

      //test what's in db
      List<TrackerRow> rows = await SqliteService().getTrackers(issues);

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

    Future<void> testPropagationEmit(IssueDetail detail, ComicTrackingStatus newStatus) async {
      await trackingCubit.updateTrackingStatus(detail, newStatus, true);

      expect(trackingCubit.state, isA<TrackingUpdated>());

      TrackingUpdated updatedStatus = trackingCubit.state as TrackingUpdated;

      expect(updatedStatus.trackables.length, 1);

      expect(updatedStatus.trackables[0].id, detail.id);
      expect(updatedStatus.trackables[0].getComicStatus().value, newStatus.value);
    }

    Future<void> testPropagationSql(int expectedLength, ComicTrackingStatus expectedStatus) async {
      List<TrackerRow> rows = await SqliteService().getAllTrackers();

      expect(rows.length, expectedLength);

      for(TrackerRow row in rows){
        expect(row.status, expectedStatus.value);
      }
    }

    test("parent insert (not to any)", () async {
      IssueDetail detail = MockModels().mockIssueDetail;

      ComicTrackingStatus newStatus = ComicTrackingStatus.have;

      await testPropagationEmit(detail, newStatus);
      await testPropagationSql(5, newStatus);
    });

    test("parent update (any to any)", () async {
      IssueDetail detail = MockModels().mockIssueDetail;
      detail.setComicStatus(ComicTrackingStatus.wished);

      ComicTrackingStatus newStatus = ComicTrackingStatus.read;

      await testPropagationEmit(detail, newStatus);
      await testPropagationSql(5, newStatus);
    });

    test("parent delete (any to not)", () async {
      IssueDetail detail = MockModels().mockIssueDetail;
      detail.setComicStatus(ComicTrackingStatus.have);

      ComicTrackingStatus newStatus = ComicTrackingStatus.notTracking;

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

      expect(errorState.trackables.isEmpty, true);
      expect(errorState.message, "Failed to get initial statuses");
    });

    test("on update single error return trackingError", () async {
      MockSqliteService mockDb = MockSqliteService();
      mockDb.fail = true;

      TrackingCubit mockCubit = TrackingCubit(mockApi: mockApi, mockDb: mockDb);

      List<IssuePreview> issues = MockModels().mockTrackedIssues;

      await mockCubit.updateTrackingStatus(issues[0], ComicTrackingStatus.notTracking);

      expect(mockCubit.state, isA<TrackingError>());

      TrackingError errorState = mockCubit.state as TrackingError;

      expect(errorState.trackables.isEmpty, true);
      expect(errorState.message, "Failed to update tracking status");
    });

    test("on update propagated error return trackingError", () async {
      MockSqliteService mockDb = MockSqliteService();

      TrackingCubit mockCubit = TrackingCubit(mockApi: mockApi, mockDb: mockDb);

      List<IssuePreview> issues = MockModels().mockTrackedIssues;

      await mockCubit.updateTrackingStatus(issues[0], ComicTrackingStatus.notTracking, true);

      expect(mockCubit.state, isA<TrackingError>());

      TrackingError errorState = mockCubit.state as TrackingError;

      expect(errorState.trackables.isEmpty, true);
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















