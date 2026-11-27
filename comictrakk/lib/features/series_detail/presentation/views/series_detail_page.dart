import 'package:comictrakk/core/constants/app_assets.dart';
import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/issues/cubit/issue_cubit.dart';
import 'package:comictrakk/features/issues/data/issue_dao.dart';
import 'package:comictrakk/features/issues/data/issue_repository.dart';
import 'package:comictrakk/features/item_search/data/search_dao.dart';
import 'package:comictrakk/features/item_search/data/search_repository.dart';
import 'package:comictrakk/features/reprints/data/reprints_dao.dart';
import 'package:comictrakk/features/reprints/data/reprints_repository.dart';
import 'package:comictrakk/features/search_results/data/search_result_dao.dart';
import 'package:comictrakk/features/search_results/data/search_results_repository.dart';
import 'package:comictrakk/features/series/cubit/series_cubit.dart';
import 'package:comictrakk/features/series/data/series_dao.dart';
import 'package:comictrakk/features/series/data/series_repository.dart';
import 'package:comictrakk/features/series_detail/presentation/widgets/series_view_body.dart';
import 'package:comictrakk/features/series_detail/presentation/widgets/series_view_header.dart';
import 'package:comictrakk/features/trackers/cubit/tracker_cubit.dart';
import 'package:comictrakk/features/trackers/data/tracker_dao.dart';
import 'package:comictrakk/features/trackers/data/tracker_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SeriesDetailPage extends StatelessWidget {
  final AppDatabase _db;
  final Series _series;

  const SeriesDetailPage({super.key, required this._db, required this._series});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SeriesCubit>(
          create: (context) {
            final seriesRepo = SeriesRepository(SeriesDao(_db));
            final resultsRepo = SearchResultsRepository(SearchResultDao(_db));
            final searchRepo = SearchRepository(SearchDao(_db));

            final cubit = SeriesCubit(repo: seriesRepo, resultsRepo: resultsRepo, searchRepo: searchRepo);


            cubit.listenToSeries(_series);
            cubit.fetchSeriesDetails(_series);

            return cubit;
          }
        ),
        BlocProvider<IssueCubit>(
          create: (context) {
            final issueDao = IssueDao(_db);
            final reprintDao = ReprintDao(_db);
            final cubit = IssueCubit(IssueRepository(dao: issueDao, reprintsDao: reprintDao));

            cubit.listenToIssuesInSeries(_series);
            cubit.fetchIssuesInSeries(_series);

            return cubit;
          }
        ),
        BlocProvider<TrackerCubit>(
          create: (context) {
            final issueDao = IssueDao(_db);
            final reprintDao = ReprintDao(_db);
            final reprintRepo = ReprintRepository(reprintDao);
            final issueRepo = IssueRepository(dao: issueDao, reprintsDao: reprintDao);
            final cubit = TrackerCubit(repo: TrackerRepository(TrackerDao(_db)), issuesRepo: issueRepo, reprintRepo: reprintRepo);

            cubit.listenToTrackersInSeries(_series);

            return cubit;
          }
        ),
      ],
      child: SeriesDetailView(series: _series),
    );
  }
}

class SeriesDetailView extends StatelessWidget {
  final Series _series;

  const SeriesDetailView({super.key, required this._series});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SeriesViewHeader(_series),
            Expanded(child: SeriesViewBody(_series))
          ],
        ),
      ),
    );
  }

  Expanded getIdleLogo() {
    return Expanded(
      child: SvgPicture.asset(
        AppAssets.batmanLogo,
        width: 110,
        height: 110,
        fit: BoxFit.contain,
      ),
    );
  }

  Center getLoadingIndicator() {
    return Center(child: CircularProgressIndicator());
  }
}
