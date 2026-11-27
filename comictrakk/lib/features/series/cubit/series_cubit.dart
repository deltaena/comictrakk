import 'dart:async';

import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/item_search/data/search_repository.dart';
import 'package:comictrakk/features/search_results/data/search_results_repository.dart';
import 'package:comictrakk/features/series/cubit/series_state.dart';
import 'package:comictrakk/features/series/data/series_repository.dart';
import 'package:comictrakk/features/series/models/series_merger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeriesCubit extends Cubit<SeriesState> {
  final SeriesRepository _repo;
  final SearchResultsRepository _resultsRepo;
  final SearchRepository _searchRepo;

  StreamSubscription<Search?>? _lastSearchSubscription;
  StreamSubscription<List<SeriesMerger>>? _lastSearchedSeriesSubscription;

  SeriesCubit({
    required this._repo,
    required this._resultsRepo,
    required this._searchRepo,
  }) : super(SeriesInitial());

  void listenToLastSearchedSeries() {
    _lastSearchedSeriesSubscription?.cancel();

    _lastSearchedSeriesSubscription = _repo.watchLastSearchedSeries().listen(
      (mergers) {
        if(mergers.isNotEmpty) {
          emit(SeriesLoaded(mergers));
        }
      },
      onError: (e) => emit(SeriesError(e.toString())),
    );
  }
  void listenAndFetchLastSearch() {
    _lastSearchSubscription?.cancel();

    _lastSearchSubscription = _searchRepo.watchLastSearch().listen((
      search,
    ) async {
      if(search == null) return;
      emit(SeriesLoading());
      List<int> fetchedSeries = await fetchSeriesByName(search.query);
      _resultsRepo.insertResults(search.query, fetchedSeries);
    }, onError: (e) => print("deltalog error ${e.toString()}"));
  }

  void listenToSeries(Series series) => _repo.watchSeries(series.id);

  Future<List<int>> fetchSeriesByName(String search) async => await _repo.fetchSeriesByName(search);
  void fetchSeriesDetails(Series series) => _repo.fetchDetails(series.id);


  @override
  Future<void> close() {
    _lastSearchSubscription?.cancel();
    _lastSearchedSeriesSubscription?.cancel();
    return super.close();
  }
}
