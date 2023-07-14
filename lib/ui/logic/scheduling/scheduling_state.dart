part of 'scheduling_bloc.dart';

enum SchedulingStatus { initial, loading, success, error }

class SchedulingState {
   late final List<Schedule> schedules;
   final SchedulingStatus status;
   final String hasError;

    SchedulingState({
      List<Schedule>? schedules,
      this.status = SchedulingStatus.initial,
      this.hasError = "",
    }) {
      this.schedules = schedules ?? [];
    }

    SchedulingState copyWith({
      List<Schedule>? schedules,
      SchedulingStatus? status,
      String? hasError,
    }) {
      return SchedulingState(
        schedules: schedules ?? this.schedules,
        status: status ?? this.status,
        hasError: hasError ?? this.hasError,
      );
    }


    factory SchedulingState.initial() {
      return SchedulingState();
    }

    factory SchedulingState.loading() {
      return SchedulingState(status: SchedulingStatus.loading);
    }

    factory SchedulingState.success(List<Schedule> schedules) {
      return SchedulingState(status: SchedulingStatus.success, schedules: schedules);
    }

    factory SchedulingState.error(String hasError) {
      return SchedulingState(status: SchedulingStatus.error, hasError: hasError);
    }
}
