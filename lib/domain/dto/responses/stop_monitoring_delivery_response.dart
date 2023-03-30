import 'package:t_paris/domain/dto/responses/monitored_stop_visit_response.dart';

class StopMonitoringDeliveryResponse {
  final DateTime responseTimestamp;
  final String version;
  final bool status;
  final MonitoredStopVisitResponse monitoredStopVisit;

  StopMonitoringDeliveryResponse({
    required this.responseTimestamp,
    required this.version,
    required this.status,
    required this.monitoredStopVisit,
  });

  factory StopMonitoringDeliveryResponse.fromJson(Map<String, dynamic> json) {
    return StopMonitoringDeliveryResponse(
      responseTimestamp: DateTime.parse(json["ResponseTimestamp"]),
      version: json["Version"],
      status: json["Status"] == "true",
      monitoredStopVisit:
          MonitoredStopVisitResponse.fromJson(json["MonitoredStopVisit"]),
    );
  }
}
