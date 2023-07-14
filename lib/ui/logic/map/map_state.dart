part of 'map_bloc.dart';

enum MapStatus { initial, loading, success, error }

class MapState {
  late final List<LineGeo> lines;
  final MapStatus status;
  final String hasError;

  MapState({
    List<LineGeo>? lines,
    this.status = MapStatus.initial,
    this.hasError = "",
  }) {
    this.lines = lines ?? [];
  }

  MapState copyWith({
    List<LineGeo>? lines,
    MapStatus? status,
    String? hasError,
  }) {
    return MapState(
      lines: lines ?? this.lines,
      status: status ?? this.status,
      hasError: hasError ?? this.hasError,
    );
  }

  factory MapState.initial() {
    return MapState();
  }

  factory MapState.loading() {
    return MapState(status: MapStatus.loading);
  }

  factory MapState.success(List<LineGeo> lines) {
    return MapState(
      lines: lines,
      status: MapStatus.success,
    );
  }

  factory MapState.error(String hasError) {
    return MapState(
      hasError: hasError,
      status: MapStatus.error,
    );
  }

}
