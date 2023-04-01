import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_paris/domain/models/mappers/stop_scheduling_mapper.dart';
import 'package:t_paris/domain/repositories/transport_scheduling_repository.dart';
import 'package:t_paris/ui/cubits/states/transport_scheduling_state.dart';
import 'package:t_paris/utils/data_state.dart';

class TransportSchedulingCubit extends Cubit<TransportSchedulingState> {
  final TransportSchedulingRepository _repository;
  String monitoringRef = "STIF:StopPoint:Q:473921:";

  TransportSchedulingCubit(this._repository)
      : super(const TransportSchedulingStateLoading()) {
    getSchedulingStop();
  }
  
  void getSchedulingStop() async {
    try {
      emit(const TransportSchedulingStateLoading());
      final siriResponse = await _repository.getStopScheduling(monitoringRef: monitoringRef);
      if(siriResponse is DataStateSuccess) {
        final stops = StopSchedulingMapper.fromSiriResponse(siriResponse.data!);
        emit(TransportSchedulingStateSuccess(stops));
      } else if (siriResponse is DataStateError) {
        emit(TransportSchedulingStateError(siriResponse.error as Error));
      }
    } on Error catch (e) {
      emit(TransportSchedulingStateError(e));
    }
  }
}
