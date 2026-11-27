import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/trackers/constants/tracker_status.dart';
import 'package:comictrakk/features/trackers/data/tracker_dao.dart';
import 'package:comictrakk/features/trackers/data/tracker_repository.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/trackers_factory.dart';

void main(){
  TrackersFactory factory = TrackersFactory();
  late TrackerRepository repo;

  late AppDatabase db;
  late TrackerDao dao;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    dao = TrackerDao(db);

    repo = TrackerRepository(dao);
  });

  tearDown(() async {
    await db.close();
  });

  group("upsertTracker", (){
    /*
      01.  empty + wish
      02.  empty + have
      03.  empty + read
      04.  wish + have
      05.  wish + read
      06.  have + wish
      07.  have + read
      08.  wish, read - read
      09.  wish, read - wish
      10.  have, read - read
      11.  have, read - have
      12.  wish - wish
      13.  have - have
      14.  read - read
    */
    test("01.  empty + wish", () async {
      final init = await repo.getAllTrackers();
      expect(init.length, 0);

      await repo.upsertTracker(factory.singleWishComp(.insert), []);

      final results = await repo.getIssueTracker(1);

      expect(results.length, 1);

      expect(results[0].issueId, 1);
      expect(results[0].parentIssueId, null);
      expect(results[0].status, TrackerStatus.wish);
    });
    test("02.  empty + have", () async {
      final init = await repo.getAllTrackers();
      expect(init.length, 0);

      await repo.upsertTracker(factory.singleHaveComp(.insert), []);

      final results = await repo.getIssueTracker(1);

      expect(results.length, 1);

      expect(results[0].issueId, 1);
      expect(results[0].parentIssueId, null);
      expect(results[0].status, TrackerStatus.have);
    });
    test("03.  empty + read", () async {
      final init = await repo.getAllTrackers();
      expect(init.length, 0);

      await repo.upsertTracker(factory.singleReadComp(.insert), []);

      final results = await repo.getIssueTracker(1);

      expect(results.length, 1);

      expect(results[0].issueId, 1);
      expect(results[0].parentIssueId, null);
      expect(results[0].status, TrackerStatus.read);
    });
    test("04.  wish + have", () async {
      final init = await repo.getAllTrackers();
      expect(init.length, 0);

      await repo.upsertTracker(factory.singleWishComp(.insert), []);
      await repo.upsertTracker(factory.singleHaveComp(.insert), []);

      final results = await repo.getIssueTracker(1);

      expect(results.length, 1);

      expect(results[0].issueId, 1);
      expect(results[0].parentIssueId, null);
      expect(results[0].status, TrackerStatus.have);
    });
    test("05.  wish + read", () async {
      final init = await repo.getAllTrackers();
      expect(init.length, 0);

      await repo.upsertTracker(factory.singleWishComp(.insert), []);
      await repo.upsertTracker(factory.singleReadComp(.insert), []);

      final results = await repo.getIssueTracker(1);

      expect(results.length, 2);

      expect(results[0].issueId, 1);
      expect(results[0].parentIssueId, null);
      expect(results[0].status, TrackerStatus.wish);

      expect(results[1].issueId, 1);
      expect(results[1].parentIssueId, null);
      expect(results[1].status, TrackerStatus.read);
    });
    test("06.  have + wish", () async {
      final init = await repo.getAllTrackers();
      expect(init.length, 0);

      await repo.upsertTracker(factory.singleHaveComp(.insert), []);
      await repo.upsertTracker(factory.singleWishComp(.insert), []);

      final results = await repo.getIssueTracker(1);

      expect(results.length, 1);

      expect(results[0].issueId, 1);
      expect(results[0].parentIssueId, null);
      expect(results[0].status, TrackerStatus.wish);
    });
    test("07.  have + read", () async {
      final init = await repo.getAllTrackers();
      expect(init.length, 0);

      await repo.upsertTracker(factory.singleHaveComp(.insert), []);
      await repo.upsertTracker(factory.singleReadComp(.insert), []);

      final results = await repo.getIssueTracker(1);

      expect(results.length, 2);

      expect(results[0].issueId, 1);
      expect(results[0].parentIssueId, null);
      expect(results[0].status, TrackerStatus.have);

      expect(results[1].issueId, 1);
      expect(results[1].parentIssueId, null);
      expect(results[1].status, TrackerStatus.read);
    });
    test("08.  wish, read - read", () async {
      final init = await repo.getAllTrackers();
      expect(init.length, 0);

      await repo.upsertTracker(factory.singleWishComp(.insert), []);
      await repo.upsertTracker(factory.singleReadComp(.insert), []);

      await repo.upsertTracker(factory.singleReadComp(.delete), []);

      final results = await repo.getIssueTracker(1);

      expect(results.length, 1);

      expect(results[0].issueId, 1);
      expect(results[0].parentIssueId, null);
      expect(results[0].status, TrackerStatus.wish);
    });
    test("09.  wish, read - wish", () async {
      final init = await repo.getAllTrackers();
      expect(init.length, 0);

      await repo.upsertTracker(factory.singleWishComp(.insert), []);
      await repo.upsertTracker(factory.singleReadComp(.insert), []);

      await repo.upsertTracker(factory.singleWishComp(.delete), []);

      final results = await repo.getIssueTracker(1);

      expect(results.length, 1);

      expect(results[0].issueId, 1);
      expect(results[0].parentIssueId, null);
      expect(results[0].status, TrackerStatus.read);
    });
    test("10.  have, read - read", () async {
      final init = await repo.getAllTrackers();
      expect(init.length, 0);

      await repo.upsertTracker(factory.singleHaveComp(.insert), []);
      await repo.upsertTracker(factory.singleReadComp(.insert), []);

      await repo.upsertTracker(factory.singleReadComp(.delete), []);

      final results = await repo.getIssueTracker(1);

      expect(results.length, 1);

      expect(results[0].issueId, 1);
      expect(results[0].parentIssueId, null);
      expect(results[0].status, TrackerStatus.have);
    });
    test("11.  have, read - have", () async {
      final init = await repo.getAllTrackers();
      expect(init.length, 0);

      await repo.upsertTracker(factory.singleHaveComp(.insert), []);
      await repo.upsertTracker(factory.singleReadComp(.insert), []);

      await repo.upsertTracker(factory.singleHaveComp(.delete), []);

      final results = await repo.getIssueTracker(1);

      expect(results.length, 1);

      expect(results[0].issueId, 1);
      expect(results[0].parentIssueId, null);
      expect(results[0].status, TrackerStatus.read);
    });
    test("12.  empty + wish", () async {
      final init = await repo.getAllTrackers();
      expect(init.length, 0);

      await repo.upsertTracker(factory.singleWishComp(.insert), []);
      await repo.upsertTracker(factory.singleWishComp(.delete), []);

      final results = await repo.getIssueTracker(1);

      expect(results.length, 0);
    });
    test("13.  empty + have", () async {
      final init = await repo.getAllTrackers();
      expect(init.length, 0);

      await repo.upsertTracker(factory.singleHaveComp(.insert), []);
      await repo.upsertTracker(factory.singleHaveComp(.delete), []);

      final results = await repo.getIssueTracker(1);

      expect(results.length, 0);
    });
    test("14.  empty + read", () async {
      final init = await repo.getAllTrackers();
      expect(init.length, 0);

      await repo.upsertTracker(factory.singleReadComp(.insert), []);
      await repo.upsertTracker(factory.singleReadComp(.delete), []);

      final results = await repo.getIssueTracker(1);

      expect(results.length, 0);
    });
  });

  Future<void> setupRainbowReprints() async {
    /*
      empty
      wish
      wish, read
      have
      have, read
    */
    final init = await repo.getAllTrackers();
    expect(init.length, 0);

    List<TrackersCompanion> reprints = List.empty(growable: true);

    reprints.add(factory.createSingleComp(2, .wish, .insert).companion);
    reprints.add(factory.createSingleComp(3, .wish, .insert).companion);
    reprints.add(factory.createSingleComp(3, .read, .insert).companion);
    reprints.add(factory.createSingleComp(4, .have, .insert).companion);
    reprints.add(factory.createSingleComp(5, .have, .insert).companion);
    reprints.add(factory.createSingleComp(5, .read, .insert).companion);

    await dao.insertMultiple(reprints);

    final setup = await repo.getAllTrackers();
    expect(setup.length, 6);
  }
  
  List<Reprint> newStatusRainbowReprints() {
    List<Reprint> reprints = List.empty(growable: true);

    reprints.add(Reprint(issueId: 1, parentId: 6, name: 'name 1'));
    reprints.add(Reprint(issueId: 2, parentId: 6, name: 'name 1'));
    reprints.add(Reprint(issueId: 3, parentId: 6, name: 'name 1'));
    reprints.add(Reprint(issueId: 4, parentId: 6, name: 'name 1'));
    reprints.add(Reprint(issueId: 5, parentId: 6, name: 'name 1'));

    return reprints;
  }

  group("upsertTrackers", (){
    /*
      01.  empty + wish
      02.  empty + have
      03.  empty + read
      04.  wish + have
      05.  wish + read
      06.  have + wish
      07.  have + read
      08.  wish, read - read
      09.  wish, read - wish
      10.  have, read - read
      11.  have, read - have
      12.  wish - wish
      13.  have - have
      14.  read - read
    */
    /*
      01. empty
      02. wish
      03. wish, read
      04. have
      05. have, read
    */
    test("01.  empty + wish", () async {
      await setupRainbowReprints();

      final newStatus = TrackerStatus.wish;

      final collection = factory.createSingleComp(6, newStatus, .insert);
      final reprints = newStatusRainbowReprints();

      await repo.upsertTracker(collection, reprints);

      final results = await repo.getAllTrackers();

      expect(results.length, 8);
    });
    test("02.  empty + have", () async {
      await setupRainbowReprints();

      final newStatus = TrackerStatus.have;

      final collection = factory.createSingleComp(6, newStatus, .insert);
      final reprints = newStatusRainbowReprints();

      await repo.upsertTracker(collection, reprints);

      final results = await repo.getAllTrackers();

      expect(results.length, 8);
    });
    test("03.  empty + read", () async {
      await setupRainbowReprints();

      final newStatus = TrackerStatus.read;

      final collection = factory.createSingleComp(6, newStatus, .insert);
      final reprints = newStatusRainbowReprints();

      await repo.upsertTracker(collection, reprints);

      final results = await repo.getAllTrackers();

      expect(results.length, 10);
    });
    test("04.  wish + have", () async {
      await setupRainbowReprints();

      final previousStatus = TrackerStatus.wish;
      final prevIssue = factory.createSingleComp(6, previousStatus, .insert);
      await repo.upsertTracker(prevIssue, []);

      final newStatus = TrackerStatus.have;

      final reprints = newStatusRainbowReprints();

      final newIssue = factory.createSingleComp(6, newStatus, .insert);
      await repo.upsertTracker(newIssue, reprints);

      final results = await repo.getAllTrackers();

      expect(results.length, 8);
    });
    test("05.  wish + read", () async {
      await setupRainbowReprints();

      final previousStatus = TrackerStatus.wish;
      final prevIssue = factory.createSingleComp(6, previousStatus, .insert);
      await repo.upsertTracker(prevIssue, []);

      final newStatus = TrackerStatus.read;

      final reprints = newStatusRainbowReprints();

      final newIssue = factory.createSingleComp(6, newStatus, .insert);
      await repo.upsertTracker(newIssue, reprints);

      final results = await repo.getAllTrackers();

      expect(results.length, 11);
    });
    test("06.  have + wish", () async {
      await setupRainbowReprints();

      final previousStatus = TrackerStatus.have;
      final prevIssue = factory.createSingleComp(6, previousStatus, .insert);
      await repo.upsertTracker(prevIssue, []);

      final newStatus = TrackerStatus.wish;

      final reprints = newStatusRainbowReprints();

      final newIssue = factory.createSingleComp(6, newStatus, .insert);
      await repo.upsertTracker(newIssue, reprints);

      final results = await repo.getAllTrackers();

      expect(results.length, 8);
    });
    test("07.  have + read", () async {
      await setupRainbowReprints();

      final previousStatus = TrackerStatus.have;
      final prevIssue = factory.createSingleComp(6, previousStatus, .insert);
      await repo.upsertTracker(prevIssue, []);

      final newStatus = TrackerStatus.read;

      final reprints = newStatusRainbowReprints();

      final newIssue = factory.createSingleComp(6, newStatus, .insert);
      await repo.upsertTracker(newIssue, reprints);

      final results = await repo.getAllTrackers();

      expect(results.length, 11);
    });
    test("08.  wish, read - read", () async {
      await setupRainbowReprints();
      
      final addWish = factory.createSingleComp(6, .wish, .insert);
      await repo.upsertTracker(addWish, []);
      
      final addRead = factory.createSingleComp(6, .read, .insert);
      await repo.upsertTracker(addRead, []);

      final reprints = newStatusRainbowReprints();

      final newIssue = factory.createSingleComp(6, .read, .delete);
      await repo.upsertTracker(newIssue, reprints);

      final results = await repo.getAllTrackers();

      expect(results.length, 5);
    });
    test("09.  wish, read - wish", () async {
      await setupRainbowReprints();

      final addWish = factory.createSingleComp(6, .wish, .insert);
      await repo.upsertTracker(addWish, []);

      final addRead = factory.createSingleComp(6, .read, .insert);
      await repo.upsertTracker(addRead, []);

      final reprints = newStatusRainbowReprints();

      final newIssue = factory.createSingleComp(6, .wish, .delete);
      await repo.upsertTracker(newIssue, reprints);

      final results = await repo.getAllTrackers();

      expect(results.length, 5);
    });
    test("10.  have, read - read", () async {
      await setupRainbowReprints();

      final addWish = factory.createSingleComp(6, .have, .insert);
      await repo.upsertTracker(addWish, []);

      final addRead = factory.createSingleComp(6, .read, .insert);
      await repo.upsertTracker(addRead, []);

      final reprints = newStatusRainbowReprints();

      final newIssue = factory.createSingleComp(6, .read, .delete);
      await repo.upsertTracker(newIssue, reprints);

      final results = await repo.getAllTrackers();

      expect(results.length, 5);
    });
    test("11.  have, read - have", () async {
      await setupRainbowReprints();

      final addWish = factory.createSingleComp(6, .have, .insert);
      await repo.upsertTracker(addWish, []);

      final addRead = factory.createSingleComp(6, .read, .insert);
      await repo.upsertTracker(addRead, []);

      final reprints = newStatusRainbowReprints();

      final newIssue = factory.createSingleComp(6, .have, .delete);
      await repo.upsertTracker(newIssue, reprints);

      final results = await repo.getAllTrackers();

      expect(results.length, 5);
    });
    test("12.  wish - wish", () async {
      await setupRainbowReprints();

      final newStatus = TrackerStatus.wish;

      final newTrackers = newStatusRainbowReprints();

      final mainPreviousStatus = factory.createSingleComp(6, newStatus, .insert);

      await repo.upsertTracker(mainPreviousStatus, []);

      final mainNewStatus = factory.createSingleComp(6, newStatus, .delete);

      await repo.upsertTracker(mainNewStatus, newTrackers);

      final results = await repo.getAllTrackers();

      expect(results.length, 4);
    });
    test("13.  have - have", () async {
      await setupRainbowReprints();

      final newStatus = TrackerStatus.have;

      final newTrackers = newStatusRainbowReprints();

      final mainPreviousStatus = factory.createSingleComp(6, newStatus, .insert);

      await repo.upsertTracker(mainPreviousStatus, []);

      final mainNewStatus = factory.createSingleComp(6, newStatus, .delete);

      await repo.upsertTracker(mainNewStatus, newTrackers);

      final results = await repo.getAllTrackers();

      expect(results.length, 4);
    });
    test("14.  read - read", () async {
      await setupRainbowReprints();

      final newStatus = TrackerStatus.read;

      final newTrackers = newStatusRainbowReprints();

      final mainPreviousStatus = factory.createSingleComp(6, newStatus, .insert);

      await repo.upsertTracker(mainPreviousStatus, []);

      final mainNewStatus = factory.createSingleComp(6, newStatus, .delete);

      await repo.upsertTracker(mainNewStatus, newTrackers);

      final results = await repo.getAllTrackers();

      expect(results.length, 4);
    });

  });



}