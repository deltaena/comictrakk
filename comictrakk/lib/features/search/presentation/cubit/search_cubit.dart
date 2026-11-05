import 'package:comictrakk/core/models/series/series_preview.dart';
import 'package:comictrakk/core/network/comic_api_client.dart';
import 'package:comictrakk/features/search/presentation/cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Future<void> search(String query) async {
    if(query.trim().isEmpty) return;

    emit(SearchLoading());

    try {
      List<SeriesPreview> seriesPreviews = await ComicApiClient().searchSeriesPreviewByName(query);

      emit(SearchLoaded(seriesPreviews));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}