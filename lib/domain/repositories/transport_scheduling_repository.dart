import 'package:t_paris/domain/models/dto/responses/siri_response.dart';
import 'package:t_paris/utils/data_state.dart';

abstract class TransportSchedulingRepository {
  Future<DataState<SiriResponse>> getStopScheduling({
    required String lineRef,
    required String monitoringRef,
  });
}
