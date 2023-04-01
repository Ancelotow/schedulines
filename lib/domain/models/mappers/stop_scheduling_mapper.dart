import 'package:t_paris/domain/models/dto/responses/siri_response.dart';
import 'package:t_paris/domain/models/entities/stop_scheduling.dart';
import 'package:t_paris/domain/models/mappers/arrival_status_mapper.dart';

abstract class StopSchedulingMapper {
  static List<StopScheduling> fromSiriResponse(SiriResponse response) {
    final monitoredStopVisits =
        response.serviceDelivery.stopMonitoringDelivery.monitoredStopVisits;
    var stops = <StopScheduling>[];
    for (var element in monitoredStopVisits) {
      final vehicleJourney = element.monitoredVehicleJourney;
      stops.add(StopScheduling(
        destination: vehicleJourney.destinationsNames[0],
        direction: vehicleJourney.directionsNames[0],
        transportRef: vehicleJourney.vehiclesJourneyNames[0],
        arrivalAt: vehicleJourney.monitoredCall.expectedArrivalTime,
        departureAt: vehicleJourney.monitoredCall.expectedDepartureTime,
        arrivalStatus: ArrivalStatusMapper.fromString(
            vehicleJourney.monitoredCall.arrivalStatus),
      ));
    }
    return stops;
  }
}
