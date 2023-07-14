part of 'stop_bloc.dart';

@immutable
abstract class StopEvent {}

class StopEventFetch extends StopEvent {
  StopEventFetch();
}
