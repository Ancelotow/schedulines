import 'geojson_feature.dart';

class Geojson {
  final String type;
  final List<GeojsonFeature> features;

  Geojson({
    required this.type,
    required this.features,
  });

  factory Geojson.fromJson(Map<String, dynamic> json) {
    final featuresJson = json["features"] as List<dynamic>;
    return Geojson(
      type: json["type"],
      features: featuresJson.map((e) => GeojsonFeature.fromJson(e)).toList()
    );
  }
}
