import 'package:t_paris/data/services/local/transport_map_local_service.dart';
import 'package:t_paris/domain/dto/responses/geojson.dart';
import 'package:t_paris/utils/data_state.dart';

import '../../../domain/repositories/transport_map_repository.dart';

class TransportMapLocalRepository implements TransportMapRepository {

  final TransportMapLocalService _service;

  TransportMapLocalRepository(this._service);

  @override
  Future<DataState<Geojson>> getLinesOnMap() async {
    try{
      final lines = await _service.getLinesMap();
      return DataStateSuccess(lines);
    } on Exception catch(e) {
      return DataStateError(e);
    }
  }

}