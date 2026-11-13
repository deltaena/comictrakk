import 'package:comictrakk/core/models/trackable/trackable.dart';

abstract class TrackingState {
  final List<Trackable> trackables;

  TrackingState({required this.trackables});
}

class TrackingLoading extends TrackingState {
  TrackingLoading(): super(trackables: List.empty());
}

class TrackingLoaded extends TrackingState {
  new({required super.trackables});
}

class TrackingUpdated extends TrackingState {
  new({required super.trackables});
}

class TrackingError extends TrackingState {
  String message;

  new({required this.message}): super(trackables: List.empty());
}