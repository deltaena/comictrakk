import 'package:drift/drift.dart';

@DataClassName('Search')
class Searches extends Table {
  TextColumn get query => text()();

  DateTimeColumn get searchedAt => dateTime()();

  @override
  Set<Column> get primaryKey => { query };
}