import 'dart:io' show HttpStatus;
import 'package:dio/dio.dart';
import 'package:t_paris/data/services/api/transport_scheduling_api_service.dart';
import 'package:t_paris/domain/models/dto/responses/siri_response.dart';
import 'package:t_paris/utils/data_state.dart';
import '../../../domain/repositories/transport_scheduling_repository.dart';

class TransportSchedulingApiRepository implements TransportSchedulingRepository {
  final TransportSchedulingApiService _service;

  TransportSchedulingApiRepository(this._service);

  @override
  Future<DataState<SiriResponse>> getStopScheduling({
    required String lineRef,
    required String monitoringRef,
  }) async {
    try{
      final httpResponse = await _service.getStopScheduling(monitoringRef, lineRef);
      if(httpResponse.response.statusCode == HttpStatus.ok) {
        return DataStateSuccess(httpResponse.data);
      } else {
        throw DioError(
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
        );
      }
    } on DioError catch(e) {
      return DataStateError(e);
    }
  }
}
