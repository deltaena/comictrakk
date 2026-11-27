import 'package:comictrakk/features/series/series.dart';
import 'package:drift/drift.dart';

class Issues extends Table {
  IntColumn get id => integer()();
  IntColumn get seriesId => integer().references(SeriesT, #id)();
  TextColumn get number => text()();
  TextColumn get name => text()();
  TextColumn get imageUrl => text()();

  @override
  Set<Column> get primaryKey => {id};
}
