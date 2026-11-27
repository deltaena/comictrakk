import 'package:comictrakk/core/database/app_database.dart';
import 'package:drift/drift.dart';

class ReprintMapper {

  ReprintsCompanion fromMap(int collectedIssueId, Map<String, dynamic> map){
    return ReprintsCompanion.insert(
        issueId: Value(map["id"]),
        name: map["issue"],
      parentId: collectedIssueId,

    );
  }

}