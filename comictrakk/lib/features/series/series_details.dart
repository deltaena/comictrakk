import 'package:comictrakk/core/database/tables/issue_series.dart';
import 'package:comictrakk/features/series/series.dart';
import 'package:drift/drift.dart';

//part 'series_detail.g.dart';

class SeriesDetails extends Table {
  IntColumn get id => integer().references(SeriesT, #id)();

  TextColumn get description => text()();

  @override
  Set<Column> get primaryKey => { id };
}