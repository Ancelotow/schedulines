part of 'stop_bloc.dart';

enum StopStatus { initial, loading, success, error }

class StopState {
  late final List<Stop> stops;
  final StopStatus status;
  final String hasError;

  StopState({
    List<Stop>? stops,
    this.status = StopStatus.initial,
    this.hasError = "",
  }) {
    this.stops = stops ?? [];
  }

  StopState copyWith({
    List<Stop>? stops,
    StopStatus? status,
    String? hasError,
  }) {
    return StopState(
      stops: stops ?? this.stops,
      status: status ?? this.status,
      hasError: hasError ?? this.hasError,
    );
  }

  factory StopState.initial() {
    return StopState();
  }

  factory StopState.loading() {
    return StopState(status: StopStatus.loading);
  }

  factory StopState.success(List<Stop> stops) {
    return StopState(
      stops: stops,
      status: StopStatus.success,
    );
  }

  factory StopState.error(String hasError) {
    return StopState(
      hasError: hasError,
      status: StopStatus.error,
    );
  }
}
