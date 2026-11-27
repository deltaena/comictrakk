import 'package:comictrakk/features/issues/issues.dart';
import 'package:comictrakk/features/issues/issue_details.dart';
import 'package:comictrakk/features/issues/models/issue_merger.dart';
import 'package:comictrakk/features/issues/models/issue_row_merger.dart';

abstract class IssueState {
  final List<IssueMerger> issues;
  IssueState(this.issues);
}

class IssueInitial extends IssueState {
  IssueInitial(): super(List.empty());
}

class IssueLoading extends IssueState {
  IssueLoading(): super(List.empty());
}

class IssueLoaded extends IssueState {
  IssueLoaded(super.issues);
}

class IssueError extends IssueState {
  final String message;
  IssueError(this.message): super(List.empty());
}