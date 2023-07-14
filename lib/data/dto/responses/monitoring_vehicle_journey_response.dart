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
    final directions = json["DirectionName"] as List;
    final destinations = json["DestinationName"] as List;
    final vehicles = json["VehicleJourneyName"] as List;
    final notes = json["JourneyNote"] as List;
    return MonitoredVehicleJourneyResponse(
      lineRef: json["LineRef"]?["value"] ?? "unknow",
      operatorRef: json["OperatorRef"]?["value"] ?? "unknow",
      directionsNames: directions.map((e) => e["value"] as String).toList(),
      destinationRef: json["DestinationRef"]?["value"] ?? "unknow",
      destinationsNames: destinations.map((e) => e["value"] as String).toList(),
      vehiclesJourneyNames: vehicles.map((e) => e["value"] as String).toList(),
      journeyNotes: notes.map((e) => e["value"] as String).toList(),
      monitoredCall: MonitoredCallResponse.fromJson(json["MonitoredCall"]),
    );
  }
}
