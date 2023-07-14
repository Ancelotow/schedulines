import 'package:t_paris/data/services/local/transport_stop_local_service.dart';
import 'package:t_paris/domain/repositories/stop_repository.dart';
import '../../../domain/models/adapter/stop_adapter.dart';
import '../../../domain/models/entities/stop.dart';

class StopLocalRepository implements StopRepository {

  final TransportStopLocalService _service;

  StopLocalRepository(this._service);

  @override
  Future<List<Stop>> getStops() async {
    final stops = await _service.getStops();
    return StopAdapter.fromListDatasetStopResponse(stops);
  }

}