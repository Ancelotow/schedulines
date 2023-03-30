import 'package:t_paris/domain/dto/responses/monitoring_vehicle_journey_response.dart';

class MonitoredStopVisitResponse {
  final DateTime recordedAtTime;
  final String itemIdentifier;
  final String monitoringRef;
  final MonitoredVehicleJourneyResponse monitoredVehicleJourney;

  MonitoredStopVisitResponse({
    required this.recordedAtTime,
    required this.itemIdentifier,
    required this.monitoringRef,
    required this.monitoredVehicleJourney,
  });

  factory MonitoredStopVisitResponse.fromJson(Map<String, dynamic> json) {
    return MonitoredStopVisitResponse(
      recordedAtTime: DateTime.parse(json["RecordedAtTime"]),
      monitoringRef: json["MonitoringRef"]?["value"] ?? "unknow",
      itemIdentifier: json["ItemIdentifier"],
      monitoredVehicleJourney: MonitoredVehicleJourneyResponse.fromJson(
          json["MonitoredVehicleJourney"]),
    );
  }
}
