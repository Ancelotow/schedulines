import 'departure_status.dart';

class StopScheduling {
  final String destination;
  final String line;
  final String direction;
  final String transportRef;
  final String operatorRef;
  final DateTime? arrivalAt;
  final DateTime departureAt;
  final DepartureStatus departureStatus;

  StopScheduling({
    required this.line,
    required this.operatorRef,
    required this.destination,
    required this.direction,
    required this.transportRef,
    required this.arrivalAt,
    required this.departureAt,
    required this.departureStatus
  });

  int arrivedIn(DateTime date) {
    return departureAt.difference(date).inMinutes;
  }
}
