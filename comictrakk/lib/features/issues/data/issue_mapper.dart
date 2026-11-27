import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/issues/models/issue_merger.dart';
import 'package:comictrakk/features/issues/models/issue_row_merger.dart';
import 'package:drift/drift.dart';

class IssueMapper {
  IssuesCompanion issueFromMap(Map<String, dynamic> map) {
    return IssuesCompanion.insert(
      id: Value(map["id"] as int),
      seriesId: map["series"]["id"],
      number: map["number"],
      name: map["issue"],
      imageUrl: map["image"],
    );
  }

  IssueDetailsCompanion issueDetailFromMap(Map<String, dynamic> map) {
    return IssueDetailsCompanion.insert(pages: map["page"]);
  }

  IssueMerger _fromRowMerger(IssueRowMerger rowMergers) {
    IssueMerger issue = IssueMerger(
      issue: rowMergers.issue,
      details: rowMergers.details,
    );

    if (rowMergers.tracker != null) issue.addTracker(rowMergers.tracker!);

    return issue;
  }

  List<IssueMerger> fromRowMergers(List<IssueRowMerger> rowMergers) {
    Map<int, IssueMerger> mergers = {};

    for (IssueRowMerger row in rowMergers) {
      int issueId = row.issue.id;

      if (mergers.containsKey(issueId)) {
        if (row.tracker != null) mergers[issueId]!.addTracker(row.tracker!);
      } else {
        mergers[issueId] = _fromRowMerger(row);
      }
    }

    return mergers.values.toList();
  }
}
