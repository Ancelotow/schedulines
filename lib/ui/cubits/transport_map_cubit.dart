import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_paris/domain/models/adapter/line_geo_adapter.dart';
import 'package:t_paris/domain/models/entities/line_geo.dart';
import 'package:t_paris/ui/cubits/states/transport_map_state.dart';
import '../../domain/repositories/transport_map_repository.dart';
import '../../utils/data_state.dart';

class TransportMapCubit extends Cubit<TransportMapState> {
  final TransportMapRepository _repository;

  TransportMapCubit(this._repository)
      : super(const TransportMapStateLoading()) {
    getLinesOnMaps();
  }

  void getLinesOnMaps() async {
    try {
      emit(const TransportMapStateLoading());
      final response = await _repository.getLinesOnMap();
      if (response is DataStateSuccess) {
        final lines = <LineGeo>[];
        for(var feature in response.data!.features){
          lines.addAll(LineGeoAdapter.fromGeojsonFeature(feature));
        }
        emit(TransportMapStateSuccess(lines));
      } else if (response is DataStateError) {
        emit(TransportMapStateError(response.error as Error));
      }
    } on Error catch (e) {
      emit(TransportMapStateError(e));
    }
  }
}
