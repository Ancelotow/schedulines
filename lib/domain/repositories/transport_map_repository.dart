import 'package:t_paris/domain/models/dto/responses/geojson.dart';
import 'package:t_paris/utils/data_state.dart';

abstract class TransportMapRepository {
  Future<DataState<Geojson>> getLinesOnMap();
}