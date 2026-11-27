import 'package:comictrakk/core/database/app_database.dart';
import 'package:drift/drift.dart';

class SearchMapper {
  SearchesCompanion fromSearch(String query){
    return SearchesCompanion.insert(
        query: query,
        searchedAt: DateTime.now()
    );
  }

  SearchesCompanion updatedTime(){
    return SearchesCompanion(
      searchedAt: Value(DateTime.now())
    );
  }
}