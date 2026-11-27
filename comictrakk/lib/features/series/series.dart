import 'package:comictrakk/features/series/series_type.dart';
import 'package:drift/drift.dart';

//part 'series.g.dart';

@DataClassName('Series')
class SeriesT extends Table {
  @override
  String get tableName => 'series';

  IntColumn get id => integer()();
  TextColumn get name => text()();
  IntColumn get volume => integer()();
  IntColumn get yearBegan => integer()();
  IntColumn get yearEnd => integer()();
  IntColumn get issueCount => integer()();
  IntColumn get seriesTypeId => integer().references(SeriesType, #id)();

  @override
  Set<Column> get primaryKey => { id };
}