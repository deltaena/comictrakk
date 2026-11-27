import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/item_search/cubit/search_cubit.dart';
import 'package:comictrakk/features/item_search/cubit/search_state.dart';
import 'package:comictrakk/features/item_search/data/search_dao.dart';
import 'package:comictrakk/features/item_search/data/search_repository.dart';
import 'package:comictrakk/features/search_anchor/widgets/suggestion_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeltaSearchAnchor extends StatelessWidget {
  final AppDatabase _db;

  const DeltaSearchAnchor(this._db, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final searchRepo = SearchRepository(SearchDao(_db));
        final cubit = SearchCubit(searchRepo);

        cubit.listenToSuggestions();

        return cubit;
      },
      child: _DeltaSearchAnchor(),
    );
  }
}

class _DeltaSearchAnchor extends StatelessWidget {

  void _updateSearch(BuildContext context, String text) => context.read<SearchCubit>().upsertSearchedItem(text);

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();

    return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return DeltaSearchBar(
          updateSearch: _updateSearch,
          controller: controller,
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return [
          BlocProvider.value(
            value: searchCubit,
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                return Column(
                  children: state.suggestions
                      .map(
                        (search) => SuggestionItem(
                          search: search,
                          updateSearch: _updateSearch,
                          controller: controller,
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ];
      },
    );
  }
}

class DeltaSearchBar extends StatelessWidget {
  final Function _updateSearch;
  final SearchController _controller;

  const DeltaSearchBar({
    super.key,
    required this._updateSearch,
    required this._controller,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: _controller,
      hintText: "Search your favourite series!",
      textInputAction: TextInputAction.search,
      trailing: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => _updateSearch(context, _controller.text),
        ),
      ],
      onTap: () {
        _controller.openView();
      },
      onSubmitted: (value) => _updateSearch(context, value),
    );
  }
}
