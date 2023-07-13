import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../dto/responses/siri_response.dart';
import '../scheduling_service.dart';

class TransportSchedulingApiService implements SchedulingService {
  final Dio _dio;

  TransportSchedulingApiService(this._dio);

  @override
  Future<SiriResponse> getStopScheduling(String monitoringRef) async {
    final params = {
      "MonitoringRef": monitoringRef,
    };
    final httpResponse = await _dio.get(
        "/stop-monitoring",
        queryParameters: params,
    );
    return SiriResponse.fromJson(httpResponse.data);
  }
}
