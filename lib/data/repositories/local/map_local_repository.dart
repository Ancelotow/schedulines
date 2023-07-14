import 'package:t_paris/data/services/local/transport_map_local_service.dart';
import 'package:t_paris/domain/models/entities/line_geo.dart';
import '../../../domain/models/adapter/line_geo_adapter.dart';
import '../../../domain/repositories/map_repository.dart';

class MapLocalRepository implements MapRepository {

  final TransportMapLocalService _service;

  MapLocalRepository(this._service);

  @override
  Future<List<LineGeo>> getLinesOnMap() async {
    final linesDto = await _service.getLinesMap();
    final lines = <LineGeo>[];
    for(var feature in linesDto.features){
      lines.addAll(LineGeoAdapter.fromGeojsonFeature(feature));
    }
    return lines;
  }

}