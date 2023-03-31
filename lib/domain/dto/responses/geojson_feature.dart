import 'geojson_feature_geometry.dart';

class GeojsonFeature {
  final String type;
  final GeojsonFeatureGeometry? geometry;
  final dynamic properties;

  GeojsonFeature({
    required this.type,
    required this.geometry,
    required this.properties,
  });

  factory GeojsonFeature.fromJson(Map<String, dynamic> json) {
    return GeojsonFeature(
      type: json["type"],
      geometry: json["geometry"] != null
          ? GeojsonFeatureGeometry.fromJson(json["geometry"])
          : null,
      properties: json["properties"],
    );
  }
}
