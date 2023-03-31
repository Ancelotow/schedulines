import '../../utils/data_state.dart';
import '../dto/responses/siri_response.dart';

abstract class TransportSchedulingRepository {
  Future<DataState<SiriResponse>> getStopScheduling({
    required String lineRef,
    required String monitoringRef,
  });
}
