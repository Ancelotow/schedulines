import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/models/entities/stop.dart';
import '../../../domain/repositories/stop_repository.dart';

part 'stop_event.dart';

part 'stop_state.dart';

class StopBloc extends Bloc<StopEvent, StopState> {
  final StopRepository repository;

  StopBloc({
    required this.repository,
  }) : super(StopState.initial()) {
    on<StopEventFetch>(_onFetch);
  }

  void _onFetch(StopEventFetch event, Emitter<StopState> emit) async {
    emit(StopState.loading());
    try {
      final stops = await repository.getStops();
      emit(StopState.success(stops));
    } catch (e) {
      emit(StopState.error(e.toString()));
    }
  }
}
