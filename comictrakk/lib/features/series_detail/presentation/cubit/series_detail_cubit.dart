import 'package:comictrakk/core/models/issue/issue_preview.dart';
import 'package:comictrakk/core/models/series/series_detail.dart';
import 'package:comictrakk/core/models/series/series_preview.dart';
import 'package:comictrakk/core/network/comic_api_client.dart';
import 'package:comictrakk/features/series_detail/presentation/cubit/series_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeriesDetailCubit extends Cubit<SeriesDetailState> {
  late final SeriesPreview _seriesPreview;

  SeriesDetailCubit({required this._seriesPreview}) : super(SeriesDetailLoading());

  Future<void> loadInitialData() async {
    try {
      SeriesDetail series = await ComicApiClient().getSeriesDetail(_seriesPreview);
      List<IssuePreview> issues = await ComicApiClient().getSeriesIssuePreviewList(series);

      emit(SeriesDetailLoaded(issues: issues, series: series));
    } catch (e) {
      emit(SeriesDetailError(message: e.toString()));
    }
  }
}