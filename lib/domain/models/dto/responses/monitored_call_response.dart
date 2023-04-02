import 'dart:ffi';

class MonitoredCallResponse {
  final List<String> stopsPointsNames;
  final bool vehicleAtStop;
  final List<String> destinationDisplays;
  final DateTime? expectedArrivalTime;
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
    final destinations = json["DestinationDisplay"] as List;
    final stopsPoints = json["StopPointName"] as List;
    return MonitoredCallResponse(
      destinationDisplays:
          destinations.map((e) => e["value"] as String).toList(),
      stopsPointsNames: stopsPoints.map((e) => e["value"] as String).toList(),
      vehicleAtStop: json["VehicleAtStop"],
      expectedArrivalTime: json["ExpectedArrivalTime"] != null
          ? DateTime.parse(json["ExpectedArrivalTime"])
          : null,
      expectedDepartureTime: json["ExpectedDepartureTime"] != null
          ? DateTime.parse(json["ExpectedDepartureTime"])
          : DateTime.now(),
      departureStatus: json["DepartureStatus"],
      arrivalStatus: json["ArrivalStatus"],
    );
  }
}
