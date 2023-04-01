import 'arrival_status.dart';

class StopScheduling {
  final String destination;
  final String direction;
  final String transportRef;
  final String operatorRef;
  final DateTime? arrivalAt;
  final DateTime departureAt;
  final ArrivalStatus arrivalStatus;

  StopScheduling({
    required this.operatorRef,
    required this.destination,
    required this.direction,
    required this.transportRef,
    required this.arrivalAt,
    required this.departureAt,
    required this.arrivalStatus
  });

  int arrivedIn(DateTime date) {
    return departureAt.difference(date).inMinutes;
  }
}
