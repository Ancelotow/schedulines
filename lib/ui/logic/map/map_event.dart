part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class MapEventFetch extends MapEvent {
  MapEventFetch();
}
