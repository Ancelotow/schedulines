import 'monitored_call_response.dart';

class MonitoredVehicleJourneyResponse {
  final String lineRef;
  final String operatorRef;
  final List<String> directionsNames;
  final String destinationRef;
  final List<String> destinationsNames;
  final List<String> vehiclesJourneyNames;
  final List<String> journeyNotes;
  final MonitoredCallResponse monitoredCall;

  MonitoredVehicleJourneyResponse({
    required this.lineRef,
    required this.operatorRef,
    required this.directionsNames,
    required this.destinationRef,
    required this.destinationsNames,
    required this.vehiclesJourneyNames,
    required this.journeyNotes,
    required this.monitoredCall,
  });

  factory MonitoredVehicleJourneyResponse.fromJson(Map<String, dynamic> json) {
    final directions = json["DirectionName"] as Map<String, dynamic>;
    final destinations = json["DestinationName"] as Map<String, dynamic>;
    final vehicles = json["VehicleJourneyName"] as Map<String, dynamic>;
    final notes = json["JourneyNote"] as Map<String, dynamic>;
    return MonitoredVehicleJourneyResponse(
      lineRef: json["LineRef"]?["value"] ?? "unknow",
      operatorRef: json["OperatorRef"]?["value"] ?? "unknow",
      directionsNames: directions.values.toList() as List<String>,
      destinationRef: json["DestinationRef"]?["value"] ?? "unknow",
      destinationsNames: destinations.values.toList() as List<String>,
      vehiclesJourneyNames: vehicles.values.toList() as List<String>,
      journeyNotes: notes.values.toList() as List<String>,
      monitoredCall: MonitoredCallResponse.fromJson(json["MonitoredCall"]),
    );
  }
}
