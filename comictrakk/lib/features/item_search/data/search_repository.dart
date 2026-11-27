import 'dart:async';

import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/item_search/data/search_dao.dart';
import 'package:comictrakk/features/item_search/data/search_mapper.dart';
import 'package:comictrakk/features/series/data/series_repository.dart';

class SearchRepository {
  final SearchDao _dao;
  final SearchMapper _mapper = SearchMapper();

  SearchRepository(this._dao);

  Stream<List<String>> watchUniqueSearches() => _dao.watchUniqueSearches();
  Stream<Search?> watchLastSearch() => _dao.watchLastSearch();

  Future<void> upsertSearchedItem(String search) async {
    bool searchExists = await _dao.searchExists(search);

    if(searchExists) {
      _dao.updateSearch(search, _mapper.updatedTime());
      return;
    }

    await _dao.addSearch( _mapper.fromSearch(search));
  }
}