import 'monitored_stop_visit_response.dart';

class StopMonitoringDeliveryResponse {
  final DateTime responseTimestamp;
  final String version;
  final bool status;
  final List<MonitoredStopVisitResponse> monitoredStopVisits;

  StopMonitoringDeliveryResponse({
    required this.responseTimestamp,
    required this.version,
    required this.status,
    required this.monitoredStopVisits,
  });

  factory StopMonitoringDeliveryResponse.fromJson(Map<String, dynamic> json) {
    final visits = json["MonitoredStopVisit"] as List<dynamic>;
    return StopMonitoringDeliveryResponse(
      responseTimestamp: DateTime.parse(json["ResponseTimestamp"]),
      version: json["Version"],
      status: json["Status"] == "true",
      monitoredStopVisits: visits.map((e) => MonitoredStopVisitResponse.fromJson(e)).toList()
    );
  }
}
