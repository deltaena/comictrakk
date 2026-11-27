import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/search_results/data/search_result_dao.dart';
import 'package:comictrakk/features/search_results/data/search_result_mapper.dart';

class SearchResultsRepository {

  final SearchResultDao _dao;
  final SearchResultMapper _mapper = SearchResultMapper();

  SearchResultsRepository(this._dao);

  void insertResults(String search, List<int> seriesIds){
    List<SearchResultsCompanion> companions = seriesIds.map((id) => _mapper.fromSearch(search, id)).toList();

    _dao.insertResults(companions);
  }

}