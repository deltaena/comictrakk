import 'package:comictrakk/core/models/issue/issue_preview.dart';
import 'package:comictrakk/core/models/series/series_detail.dart';

abstract class SeriesDetailState {}

class SeriesDetailLoading extends SeriesDetailState {}

class SeriesDetailLoaded extends SeriesDetailState {
  late List<IssuePreview> issues;
  late SeriesDetail series;

  SeriesDetailLoaded({required this.issues, required this.series});
}

class SeriesDetailError extends SeriesDetailState {
  late String message;

  SeriesDetailError({required this.message});
}