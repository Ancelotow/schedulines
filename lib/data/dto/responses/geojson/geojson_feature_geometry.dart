class GeojsonFeatureGeometry {
  final String type;
  final dynamic coordinates;

  GeojsonFeatureGeometry({
    required this.coordinates,
    required this.type,
  });

  factory GeojsonFeatureGeometry.fromJson(Map<String, dynamic> json) {
    return GeojsonFeatureGeometry(
      coordinates: json["coordinates"],
      type: json["type"],
    );
  }
}
