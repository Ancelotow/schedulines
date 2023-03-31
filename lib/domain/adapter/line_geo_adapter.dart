import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../extensions/hex_color.dart';
import '../models/line_geo.dart';

class LineGeoAdapter {

  static List<LineGeo> fromGeojson(Map<String, dynamic> json) {
    final lines = <LineGeo>[];
    final coordinatesJson = json["geometry"]["coordinates"] as List<dynamic>;
    final name = json["properties"]["route_long_name"];
    final mode = json["properties"]["route_type"];
    final color = HexColor.fromHex(json["properties"]["route_color"]);
    var coordinates = <LatLng>[];
    if (json["geometry"]["type"] == "MultiLineString") {
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
    return lines;
  }

}
