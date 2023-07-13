import 'package:t_paris/data/services/api/transport_scheduling_api_service.dart';
import '../../../domain/models/entities/line.dart';
import '../../../domain/models/entities/schedule.dart';
import '../../../domain/models/mappers/schedule_mapper.dart';
import '../../../domain/models/mappers/stop_scheduling_mapper.dart';
import '../../../domain/repositories/scheduling_repository.dart';

class TransportSchedulingApiRepository implements SchedulingRepository {
  final TransportSchedulingApiService _service;

  TransportSchedulingApiRepository(this._service);

  @override
  Future<List<Schedule>> getStopScheduling({
    required String monitoringRef,
    required List<Line> lines,
  }) async {
    final response = await _service.getStopScheduling(monitoringRef);
    final stops = StopSchedulingMapper.fromSiriResponse(response);
    return ScheduleMapper.fromStopsAndLines(stops, lines);
  }
}
