import 'package:google_maps_flutter/google_maps_flutter.dart';

class Stop {
  final String name;
  final String operator;
  final String idRef;
  final LatLng coordinates;
  final List<String> lines;
  final List<String> modes;
  final bool isMetroTerminus;
  final bool isTrainTerminus;

  Stop({
    required this.name,
    required this.operator,
    required this.idRef,
    required this.coordinates,
    this.lines = const [],
    this.modes = const [],
    this.isMetroTerminus = false,
    this.isTrainTerminus = false,
  });


}
