import 'package:collection/collection.dart';
import 'package:t_paris/domain/models/entities/line.dart';
import 'package:t_paris/domain/models/entities/schedule.dart';
import 'package:t_paris/domain/models/entities/stop_scheduling.dart';

class ScheduleMapper {
  static List<Schedule> fromStopsAndLines(
      List<StopScheduling> stopsSchedules, List<Line> lines) {
    final schedules = <Schedule>[];
    final results = groupBy(stopsSchedules, (e) => "${e.direction}#${e.line}");
    for (var key in results.keys) {
      final direction = key.split('#')[0];
      final lineRef = key.split('#')[1];
      schedules.add(Schedule(
        direction: direction,
        line: lines.where((e) => e.idRef == lineRef.split(':')[3]).first,
        schedules: results[key]?.toList() ?? [],
      ));
    }
    return schedules;
  }
}
