import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:t_paris/domain/dto/responses/geojson.dart';
import 'package:t_paris/domain/dto/responses/geojson_feature.dart';

import '../extensions/hex_color.dart';
import '../models/line_geo.dart';

class LineGeoAdapter {

  static List<LineGeo> fromGeojsonFeature(GeojsonFeature features) {
    final lines = <LineGeo>[];
    if(features.geometry != null) {
      final coordinatesJson = features.geometry!.coordinates as List<dynamic>;
      final name = features.properties["route_long_name"];
      final mode = features.properties["route_type"];
      final color = HexColor.fromHex(features.properties["route_color"]);
      var coordinates = <LatLng>[];
      if (features.geometry!.type == "MultiLineString") {
        for (var line in coordinatesJson) {
          coordinates = [];
          for (var crd in line) {
            coordinates.add(LatLng(crd[1] as double, crd[0] as double));
          }
          lines.add(LineGeo(
            line: name,
            mode: mode,
            color: color,
            coordinates: coordinates,
          ));
        }
      } else {
        for (var crd in coordinatesJson) {
          coordinates.add(LatLng(crd[1] as double, crd[0] as double));
        }
        lines.add(LineGeo(
          line: name,
          mode: mode,
          color: color,
          coordinates: coordinates,
        ));
      }
    }
    return lines;
  }

}
