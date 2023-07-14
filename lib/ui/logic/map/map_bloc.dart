import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/models/entities/line_geo.dart';
import '../../../domain/repositories/map_repository.dart';

part 'map_event.dart';

part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final MapRepository repository;

  MapBloc({
    required this.repository,
  }) : super(MapState.initial()) {
    on<MapEventFetch>(_onFetch);
  }

  void _onFetch(MapEventFetch event, Emitter<MapState> emit) async {
    emit(MapState.loading());
    try {
      final lines = await repository.getLinesOnMap();
      emit(MapState.success(lines));
    } catch (e) {
      emit(MapState.error(e.toString()));
    }
  }
}
