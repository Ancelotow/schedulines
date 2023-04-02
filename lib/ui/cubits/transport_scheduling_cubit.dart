import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_paris/domain/models/entities/line.dart';
import 'package:t_paris/domain/models/mappers/line_mapper.dart';
import 'package:t_paris/domain/models/mappers/schedule_mapper.dart';
import 'package:t_paris/domain/models/mappers/stop_scheduling_mapper.dart';
import 'package:t_paris/domain/repositories/transport_line_repository.dart';
import 'package:t_paris/domain/repositories/transport_scheduling_repository.dart';
import 'package:t_paris/ui/cubits/states/transport_scheduling_state.dart';
import 'package:t_paris/utils/data_state.dart';

class TransportSchedulingCubit extends Cubit<TransportSchedulingState> {
  final TransportSchedulingRepository _repositorySchedule;
  final TransportLineRepository _repositoryLine;

  List<Line> _lines = [];
  String monitoringRef = "STIF:StopPoint:Q:473921:";

  TransportSchedulingCubit(this._repositorySchedule, this._repositoryLine)
      : super(const TransportSchedulingStateLoading()) {
    getSchedulingStop();
  }
  
  void getSchedulingStop() async {
    try {
      emit(const TransportSchedulingStateLoading());
      if(_lines.isEmpty) {
        final lineResponse = await _repositoryLine.getLines();
        if(lineResponse is DataStateSuccess) {
          _lines = LineMapper.fromDatasetLineResponse(lineResponse.data!);
        }
      }
      final siriResponse = await _repositorySchedule.getStopScheduling(monitoringRef: monitoringRef);
      if(siriResponse is DataStateSuccess) {
        final stops = StopSchedulingMapper.fromSiriResponse(siriResponse.data!);
        final schedules = ScheduleMapper.fromStopsAndLines(stops, _lines);
        emit(TransportSchedulingStateSuccess(schedules));
      } else if (siriResponse is DataStateError) {
        emit(TransportSchedulingStateError(siriResponse.error as Error));
      }
    } on Error catch (e) {
      emit(TransportSchedulingStateError(e));
    }
  }
}
