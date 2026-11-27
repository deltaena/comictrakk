import 'package:flutter/material.dart';

class SuggestionItem extends StatelessWidget {
  final SearchController _controller;
  final Function _updateSearch;
  final String _search;

  const SuggestionItem({
    super.key,
    required this._search,
    required this._updateSearch,
    required this._controller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.closeView("");
        _updateSearch(context, _search);
      },
      child: ListTile(title: Text(_search)),
    );
  }
}
