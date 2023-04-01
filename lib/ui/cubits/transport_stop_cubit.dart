import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_paris/domain/models/adapter/stop_adapter.dart';
import 'package:t_paris/domain/repositories/transport_stop_repository.dart';
import 'package:t_paris/ui/cubits/states/transport_stop_state.dart';
import 'package:t_paris/utils/data_state.dart';

class TransportStopCubit extends Cubit<TransportStopState> {
  final TransportStopRepository _repository;

  TransportStopCubit(this._repository)
      : super(const TransportStopStateLoading()) {
    getAllStops();
  }

  void getAllStops() async {
    try {
      emit(const TransportStopStateLoading());
      final response = await _repository.getStops();
      if (response is DataStateSuccess) {
        final stops = StopAdapter.fromListDatasetStopResponse(response.data!);
        emit(TransportStopStateSuccess(stops));
      } else if (response is DataStateError) {
        emit(TransportStopStateError(response.error as Error));
      }
    } on Error catch (e) {
      emit(TransportStopStateError(e));
    }
  }

}