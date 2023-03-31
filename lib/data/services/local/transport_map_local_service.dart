import 'dart:convert';

import 'package:flutter/services.dart';
import '../../../domain/dto/responses/geojson.dart';

class TransportMapLocalService {

  Future<Geojson> getLinesMap() async {
    final result = await rootBundle.loadString('assets/geo/lines.geojson');
    final data = json.decode(result);
    return Geojson.fromJson(data);
  }

}