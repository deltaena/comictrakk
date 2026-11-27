import 'package:comictrakk/core/database/app_database.dart';

class SearchResultMapper {

  SearchResultsCompanion fromSearch(String search, int seriesId){
    return SearchResultsCompanion.insert(
        search: search,
        seriesId: seriesId
    );
  }

}