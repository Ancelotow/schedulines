import 'dart:ui';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LineGeo {
  final String line;
  final List<LatLng> coordinates;
  final String mode;
  final Color color;

  LineGeo({
    required this.line,
    required this.coordinates,
    required this.mode,
    required this.color,
  });
}
