import 'package:t_paris/domain/models/entities/arrival_status.dart';

class ArrivalStatusAssetAdapter {

  static String fromArrivalStatus(ArrivalStatus status) {
    switch(status) {
      case ArrivalStatus.cancel:
        return "assets/icons/on_cancel.svg";

      case ArrivalStatus.onLate:
        return "assets/icons/on_late.svg";

      default:
        return "assets/icons/on_time.svg";
    }
  }

}