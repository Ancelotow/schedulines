import 'package:t_paris/domain/models/entities/line.dart';
import 'package:t_paris/domain/models/entities/stop_scheduling.dart';

class Schedule {
  final String direction;
  final Line line;
  final List<StopScheduling> schedules;

  Schedule({
    required this.direction,
    required this.line,
    required this.schedules,
  });
}
