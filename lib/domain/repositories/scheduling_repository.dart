import 'package:t_paris/domain/models/entities/schedule.dart';

import '../models/entities/line.dart';

abstract class SchedulingRepository {
  Future<List<Schedule>> getStopScheduling({
    required String monitoringRef,
    required List<Line> lines,
  });
}
