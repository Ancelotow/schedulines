import 'package:t_paris/domain/models/entities/departure_status.dart';

class ArrivalStatusAssetAdapter {

  static String fromArrivalStatus(DepartureStatus status) {
    switch(status) {
      case DepartureStatus.cancel:
        return "assets/icons/on_cancel.svg";

      case DepartureStatus.onLate:
        return "assets/icons/on_late.svg";

      default:
        return "assets/icons/on_time.svg";
    }
  }

}