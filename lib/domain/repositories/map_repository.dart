import 'package:t_paris/domain/models/entities/line_geo.dart';

abstract class MapRepository {

  Future<List<LineGeo>> getLinesOnMap();

}