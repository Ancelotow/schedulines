part of 'scheduling_bloc.dart';

@immutable
abstract class SchedulingEvent {}

class SchedulingEventFetch extends SchedulingEvent {
  final String monitoringRef;

  SchedulingEventFetch(this.monitoringRef);
}
