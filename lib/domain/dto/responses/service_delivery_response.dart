import 'package:t_paris/domain/dto/responses/stop_monitoring_delivery_response.dart';

class ServiceDeliveryResponse {
  final DateTime responseTimestamp;
  final String producerRef;
  final String reponseMessageIdentifier;
  final StopMonitoringDeliveryResponse stopMonitoringDelivery;

  ServiceDeliveryResponse({
    required this.responseTimestamp,
    required this.producerRef,
    required this.reponseMessageIdentifier,
    required this.stopMonitoringDelivery,
  });

  factory ServiceDeliveryResponse.fromJson(Map<String, dynamic> json) {
    return ServiceDeliveryResponse(
      responseTimestamp: DateTime.parse(json["ResponseTimestamp"]),
      producerRef: json["ProducerRef"],
      reponseMessageIdentifier: json["ResponseMessageIdentifier"],
      stopMonitoringDelivery: StopMonitoringDeliveryResponse.fromJson(
          json["StopMonitoringDelivery"][0]),
    );
  }
}
