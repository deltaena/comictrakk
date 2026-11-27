import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/item_search/cubit/search_cubit.dart';
import 'package:comictrakk/features/item_search/data/search_dao.dart';
import 'package:comictrakk/features/item_search/data/search_repository.dart';
import 'package:comictrakk/features/search/presentation/widgets/search_view_body.dart';
import 'package:comictrakk/features/search/presentation/widgets/search_view_header.dart';
import 'package:comictrakk/features/search_results/data/search_result_dao.dart';
import 'package:comictrakk/features/search_results/data/search_results_repository.dart';
import 'package:comictrakk/features/series/cubit/series_cubit.dart';
import 'package:comictrakk/features/series/data/series_dao.dart';
import 'package:comictrakk/features/series/data/series_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  final AppDatabase _db;

  const SearchPage({super.key, required this._db});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          final seriesRepo = SeriesRepository(SeriesDao(_db));
          final resultsRepo = SearchResultsRepository(SearchResultDao(_db));
          final searchRepo = SearchRepository(SearchDao(_db));

          final cubit = SeriesCubit(repo: seriesRepo, resultsRepo: resultsRepo, searchRepo: searchRepo);

          cubit.listenAndFetchLastSearch();
          cubit.listenToLastSearchedSeries();

          return cubit;
        },
        child: SearchView(db: _db)
    );
  }
}

class SearchView extends StatelessWidget {
  final AppDatabase _db;

  const SearchView({super.key, required this._db});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchViewHeader(_db),
            SearchViewBody(_db)
          ],
        )
      )
    );
  }
}