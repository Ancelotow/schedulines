import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../../domain/models/entities/schedule.dart';
import '../../../domain/repositories/line_repository.dart';
import '../../../domain/repositories/scheduling_repository.dart';

part 'scheduling_event.dart';
part 'scheduling_state.dart';

class SchedulingBloc extends Bloc<SchedulingEvent, SchedulingState> {
  final SchedulingRepository repository;
  final LineRepository lineRepository;


  SchedulingBloc({
    required this.repository,
    required this.lineRepository,
  }) : super(SchedulingState.initial()) {
    on<SchedulingEventFetch>(_onFetch);
  }

  void _onFetch(SchedulingEventFetch event, Emitter<SchedulingState> emit) async {
    emit(SchedulingState.loading());
    try {
      final lines = await lineRepository.getLines();
      final schedules = await repository.getStopScheduling(
        monitoringRef: event.monitoringRef,
        lines: lines,
      );
      emit(SchedulingState.success(schedules));
    } catch (e) {
      debugPrint("ERROR : ${e.toString()}");
      emit(SchedulingState.error(e.toString()));
    }
  }
}
