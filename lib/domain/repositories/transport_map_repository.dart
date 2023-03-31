import '../../utils/data_state.dart';
import '../dto/responses/geojson.dart';

abstract class TransportMapRepository {
  Future<DataState<Geojson>> getLinesOnMap();
}