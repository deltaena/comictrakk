import 'package:comictrakk/features/item_search/searches.dart';
import 'package:comictrakk/features/series/series.dart';
import 'package:drift/drift.dart';

class SearchResults extends Table {

  TextColumn get search => text().references(Searches, #query)();
  IntColumn get seriesId => integer().references(SeriesT, #id)();

  @override
  Set<Column> get primaryKey => { search, seriesId };
}