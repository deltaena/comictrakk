import 'package:drift/drift.dart';

//part 'series_type.g.dart';

class SeriesType extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => { id };
}