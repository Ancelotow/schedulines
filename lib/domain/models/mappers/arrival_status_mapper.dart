import 'package:t_paris/domain/models/entities/arrival_status.dart';

abstract class ArrivalStatusMapper {
  static ArrivalStatus fromString(String status) {
    switch (status) {
      case "onTime":
        return ArrivalStatus.onTime;

      case "onLate":
        return ArrivalStatus.onLate;

      default:
        return ArrivalStatus.unknown;
    }
  }
}
