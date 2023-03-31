import 'package:t_paris/domain/dto/responses/service_delivery_response.dart';

class SiriResponse {
  final ServiceDeliveryResponse serviceDelivery;

  SiriResponse({required this.serviceDelivery});

  factory SiriResponse.fromJson(Map<String, dynamic> json) {
    return SiriResponse(
      serviceDelivery:
          ServiceDeliveryResponse.fromJson(json["Siri"]["ServiceDelivery"]),
    );
  }
}
