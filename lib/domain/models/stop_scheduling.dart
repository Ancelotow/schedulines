import 'arrival_status.dart';

class StopScheduling {
  final String destination;
  final String direction;
  final String transportRef;
  final DateTime arrivalAt;
  final DateTime departureAt;
  final ArrivalStatus arrivalStatus;

  StopScheduling({
    required this.destination,
    required this.direction,
    required this.transportRef,
    required this.arrivalAt,
    required this.departureAt,
    required this.arrivalStatus
  });

  int arrivedIn(DateTime date) {
    return arrivalAt.difference(date).inMinutes;
  }
}
