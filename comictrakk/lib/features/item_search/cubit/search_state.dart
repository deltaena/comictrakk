import 'package:comictrakk/core/database/app_database.dart';

class SearchState {
  late List<String> suggestions;
  late List<Series> searchResult;
  final bool isLoading;

  SearchState({
    this.suggestions = const [],
    this.searchResult = const [],
    this.isLoading = false
  });

  SearchState copyWith({
    List<String>? suggestions,
    List<Series>? searchResult,
    bool? isLoading,
  }) {
    return SearchState(
      suggestions: suggestions ?? this.suggestions,
      searchResult: searchResult ?? this.searchResult,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}