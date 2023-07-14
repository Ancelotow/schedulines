class LineResponse {
  final String idLine;
  final String name;
  final String mode;
  final bool accessibility;
  final String operatorName;
  final String operatorRef;
  final String networkName;
  final String fullName;
  final String colorHex;

  LineResponse({
    required this.idLine,
    required this.name,
    required this.networkName,
    required this.fullName,
    required this.mode,
    required this.accessibility,
    required this.operatorRef,
    required this.operatorName,
    required this.colorHex,
  });

  factory LineResponse.fromJson(Map<String, dynamic> json) {
    return LineResponse(
      idLine: json["id_line"],
      mode: json["transportmode"],
      networkName: json["networkname"] ?? "",
      fullName: json["shortname_groupoflines"] ?? "",
      name: json["name_line"],
      accessibility: json["accessibility"] == "true",
      operatorRef: json["operatorref"],
      operatorName: json["operatorname"],
      colorHex: json["colourweb_hexa"],
    );
  }
}
