import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../dto/responses/siri_response.dart';
import '../scheduling_service.dart';

class SchedulingApiService implements SchedulingService {
  final Dio _dio;

  SchedulingApiService(this._dio);

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
