import 'package:comictrakk/features/issues/issues.dart';
import 'package:drift/drift.dart';

class Reprints extends Table {
  @ReferenceName("reprintId")
  IntColumn get issueId => integer().references(Issues, #id)();
  @ReferenceName("reprintParentId")
  IntColumn get parentId => integer().references(Issues, #id)();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => { issueId };
}