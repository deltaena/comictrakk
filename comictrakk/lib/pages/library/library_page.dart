import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/issues/cubit/issue_cubit.dart';
import 'package:comictrakk/features/issues/data/issue_dao.dart';
import 'package:comictrakk/features/issues/data/issue_repository.dart';
import 'package:comictrakk/features/reprints/data/reprints_dao.dart';
import 'package:comictrakk/features/reprints/data/reprints_repository.dart';
import 'package:comictrakk/features/trackers/cubit/tracker_cubit.dart';
import 'package:comictrakk/features/trackers/data/tracker_dao.dart';
import 'package:comictrakk/features/trackers/data/tracker_repository.dart';
import 'package:comictrakk/pages/library/library_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'library_view_header.dart';

class LibraryPage extends StatelessWidget {
  final AppDatabase _db;

  const LibraryPage(this._db, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final reprintDao = ReprintDao(_db);
        final reprintRepo = ReprintRepository(reprintDao);

        final issueDao = IssueDao(_db);
        final issueRepo = IssueRepository(
          dao: issueDao,
          reprintsDao: reprintDao,
        );

        final trackerDao = TrackerDao(_db);
        final trackerRepo = TrackerRepository(trackerDao);

        final issueCubit = IssueCubit(issueRepo);

        final trackerCubit = TrackerCubit(
          repo: trackerRepo,
          issuesRepo: issueRepo,
          reprintRepo: reprintRepo,
        );
        trackerCubit.listenToAllTrackers();

        return trackerCubit;
      },
      child: LibraryView(),
    );
  }
}

class LibraryView extends StatelessWidget {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LibraryViewHeader(),
            Expanded(child: LibraryViewBody()),
          ],
        ),
      ),
    );
  }
}
