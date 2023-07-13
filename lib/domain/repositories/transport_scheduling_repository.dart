import 'package:t_paris/utils/data_state.dart';
import '../../data/dto/responses/siri_response.dart';

abstract class TransportSchedulingRepository {
  Future<DataState<SiriResponse>> getStopScheduling({
    required String monitoringRef,
  });
}
