import 'dart:async';

import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/item_search/cubit/search_state.dart';
import 'package:comictrakk/features/item_search/data/search_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository _repo;
  StreamSubscription<List<String>>? _suggestionSubscription;

  new(this._repo) : super(SearchState());

  void listenToSuggestions() {
    _suggestionSubscription?.cancel();
    _suggestionSubscription = _repo.watchUniqueSearches().listen(
      (searches) => emit(state.copyWith(suggestions: searches)),
      onError: (error) => print("deltalog watch all series failed")
    );
  }

  void upsertSearchedItem(String query) => _repo.upsertSearchedItem(query);

  @override
  Future<void> close() {
    _suggestionSubscription?.cancel();

    return super.close();
  }
}
