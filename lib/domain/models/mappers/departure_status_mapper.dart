import 'package:t_paris/domain/models/entities/departure_status.dart';

abstract class DepartureStatusMapper {
  static DepartureStatus fromString(String status) {
    switch (status) {
      case "onTime":
        return DepartureStatus.onTime;

      case "cancelled":
        return DepartureStatus.cancel;

      default:
        return DepartureStatus.unknown;
    }
  }
}
