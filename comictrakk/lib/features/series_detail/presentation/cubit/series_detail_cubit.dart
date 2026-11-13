import 'package:comictrakk/core/models/issue/issue_preview.dart';
import 'package:comictrakk/core/models/series/series_detail.dart';
import 'package:comictrakk/core/models/series/series_snippet.dart';
import 'package:comictrakk/core/network/comic_api_client.dart';
import 'package:comictrakk/features/series_detail/presentation/cubit/series_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeriesDetailCubit extends Cubit<SeriesDetailState> {
  final ComicApiClient _comicApi;

  late final SeriesSnippet _seriesSnippet;

  SeriesDetailCubit({required this._seriesSnippet, ComicApiClient? mockApi}) :
        _comicApi = mockApi ?? ComicApiClient(), super(SeriesDetailLoading());

  Future<void> loadInitialData() async {
    try {
      SeriesDetail series = await _comicApi.getSeriesDetail(_seriesSnippet);
      List<IssuePreview> issues = await _comicApi.getSeriesIssues(series);

      emit(SeriesDetailLoaded(issues: issues, series: series));
    } catch (e) {
      emit(SeriesDetailError(message: e.toString()));
    }
  }
}