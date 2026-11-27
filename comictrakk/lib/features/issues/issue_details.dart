import 'package:drift/drift.dart';
import 'issues.dart';

class IssueDetails extends Table {
  IntColumn get id => integer().references(Issues, #id)();

  IntColumn get pages => integer()();

  @override
  Set<Column> get primaryKey => { id };
}