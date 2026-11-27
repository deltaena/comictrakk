import 'package:comictrakk/features/series/series.dart';
import 'package:drift/drift.dart';

//part 'issue_series.g.dart';

class IssueSeries extends Table {
  IntColumn get id => integer().references(SeriesT, #id)();
  TextColumn get name => text()();
  IntColumn get volume => integer()();
  IntColumn get yearBegan => integer()();

  @override
  Set<Column> get primaryKey => { id };
}