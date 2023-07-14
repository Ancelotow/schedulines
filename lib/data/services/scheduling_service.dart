import '../dto/responses/siri_response.dart';

abstract class SchedulingService {

  Future<SiriResponse> getStopScheduling(String monitoringRef);

}