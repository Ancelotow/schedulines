import 'package:t_paris/utils/data_state.dart';

import '../../data/dto/responses/geojson.dart';

abstract class TransportMapRepository {
  Future<DataState<Geojson>> getLinesOnMap();
}