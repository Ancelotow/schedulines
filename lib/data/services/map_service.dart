import '../dto/responses/geojson/geojson.dart';

abstract class MapService {

  Future<Geojson> getLinesMap();

}