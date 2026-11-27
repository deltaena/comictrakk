import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/series/series_details.dart';
import 'package:comictrakk/features/series/models/series_merger.dart';

abstract class SeriesState {
  final List<SeriesMerger> mergers;

  SeriesState(this.mergers);
}

class SeriesInitial extends SeriesState {
  SeriesInitial(): super(List.empty());
}

class SeriesLoading extends SeriesState {
  SeriesLoading(): super(List.empty());
}

class SeriesLoaded extends SeriesState {
  SeriesLoaded(super.series);
}

class SeriesError extends SeriesState {
  String message;

  SeriesError(this.message): super(List.empty());
}