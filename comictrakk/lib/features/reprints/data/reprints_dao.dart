import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/reprints/reprints.dart';
import 'package:drift/drift.dart';

part 'reprints_dao.g.dart';

@DriftAccessor(tables: [Reprints])
class ReprintDao extends DatabaseAccessor<AppDatabase> with _$ReprintDaoMixin {
  new(super.attachedDatabase);

  Future<List<Reprint>> getReprintsOfCollection(int collectedIssue) async {
    return (select(reprints)..where((reprint) => reprint.parentId.equals(collectedIssue))).get();
  }

  Future<void> insertMultiple(List<ReprintsCompanion> companions) async {
    await batch((batch) {
      batch.insertAll(reprints, companions, mode: InsertMode.insertOrReplace);
    });
  }

  Future<void> insertReprint(ReprintsCompanion reprint) => into(reprints).insert(reprint);
  Future<void> deleteReprint(ReprintsCompanion reprint) => delete(reprints).delete(reprint);
}