import 'dart:ffi';

class MonitoredCallResponse {
  final List<String> stopsPointsNames;
  final bool vehicleAtStop;
  final List<String> destinationDisplays;
  final DateTime expectedArrivalTime;
  final DateTime expectedDepartureTime;
  final String departureStatus;
  final String arrivalStatus;

  MonitoredCallResponse({
    required this.destinationDisplays,
    required this.stopsPointsNames,
    required this.vehicleAtStop,
    required this.expectedArrivalTime,
    required this.expectedDepartureTime,
    required this.departureStatus,
    required this.arrivalStatus,
  });

  factory MonitoredCallResponse.fromJson(Map<String, dynamic> json) {
    final destinations = json["DestinationDisplay"] as Map<String, dynamic>;
    final stopsPoints = json["StopPointName"] as Map<String, dynamic>;
    return MonitoredCallResponse(
      destinationDisplays: destinations.values.toList() as List<String>,
      stopsPointsNames: stopsPoints.values.toList() as List<String>,
      vehicleAtStop: json["VehicleAtStop"]?.toLowerCase() == "true",
      expectedArrivalTime: DateTime.parse(json["ExpectedArrivalTime"]),
      expectedDepartureTime: DateTime.parse(json["ExpectedDepartureTime"]),
      departureStatus: json["DepartureStatus"],
      arrivalStatus: json["ArrivalStatus"],
    );
  }
}
