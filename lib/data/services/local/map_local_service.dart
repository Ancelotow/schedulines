import 'dart:convert';
import 'package:flutter/services.dart';
import '../../dto/responses/geojson/geojson.dart';
import '../map_service.dart';

class MapLocalService implements MapService {

  @override
  Future<Geojson> getLinesMap() async {
    final result = await rootBundle.loadString('assets/geo/lines.geojson');
    final data = json.decode(result);
    return Geojson.fromJson(data);
  }

}