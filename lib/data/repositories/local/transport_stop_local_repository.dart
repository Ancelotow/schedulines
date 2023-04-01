import 'package:t_paris/data/services/local/transport_stop_local_service.dart';
import 'package:t_paris/domain/models/dto/responses/dataset_stop_response.dart';
import 'package:t_paris/domain/repositories/transport_stop_repository.dart';
import 'package:t_paris/utils/data_state.dart';

class TransportStopLocalRepository implements TransportStopRepository {

  final TransportStopLocalService _service;

  TransportStopLocalRepository(this._service);

  @override
  Future<DataState<List<DatasetStopResponse>>> getStops() async {
    try {
      final stops = await _service.getStops();
      return DataStateSuccess(stops);
    } on Exception catch(e) {
      return DataStateError(e);
    }
  }

}