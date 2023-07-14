import '../../../domain/models/entities/line.dart';
import '../../../domain/models/entities/schedule.dart';
import '../../../domain/models/mappers/schedule_mapper.dart';
import '../../../domain/models/mappers/stop_scheduling_mapper.dart';
import '../../../domain/repositories/scheduling_repository.dart';
import '../../services/scheduling_service.dart';

class SchedulingApiRepository implements SchedulingRepository {
  final SchedulingService _service;

  SchedulingApiRepository(this._service);

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
