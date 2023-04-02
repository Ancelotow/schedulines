import 'package:google_maps_flutter/google_maps_flutter.dart';

class StopResponse {
  final double principal;
  final String nomZdl;
  final String label;

  /// Nom de la station
  final String terval;

  /// Terminus de métro (1 ou 0)

  final String termtro;

  /// Terminus de train (1 ou 0)

  final String tertrain;

  final String nomLda;
  final double fer;
  final double idf;
  final double train;
  final double rer;
  final double val;
  final double metro;
  final double navette;
  final double tramway;
  final String exploitant;
  final String nomLong;
  final String mode;

  /// Lignes sur la station
  final String resCom;

  /// Id des lignes
  final String idRefLigC;

  /// Id de l'arrêt

  final double idRedLda;

  /// Coordonées

  final LatLng coordinates;

  StopResponse({
    required this.principal,
    required this.nomZdl,
    required this.label,
    required this.terval,
    required this.termtro,
    required this.tertrain,
    required this.nomLda,
    required this.fer,
    required this.idf,
    required this.train,
    required this.rer,
    required this.val,
    required this.metro,
    required this.navette,
    required this.tramway,
    required this.exploitant,
    required this.nomLong,
    required this.mode,
    required this.resCom,
    required this.idRefLigC,
    required this.idRedLda,
    required this.coordinates,
  });

  factory StopResponse.fromJson(Map<String, dynamic> json) {
    return StopResponse(
      principal: json["principal"],
      nomZdl: json["nom_zdl"],
      label: json["label"],
      terval: json["terval"],
      termtro: json["termetro"],
      tertrain: json["tertrain"],
      nomLda: json["nom_lda"],
      fer: json["fer"] ?? 0.0,
      idf: json["idf"] ?? 0.0,
      train: json["train"] ?? 0.0,
      rer: json["rer"] ?? 0.0,
      val: json["val"] ?? 0.0,
      metro: json["metro"] ?? 0.0,
      navette: json["navette"] ?? 0.0,
      tramway: json["tramway"] ?? 0.0,
      exploitant: json["exploitant"],
      nomLong: json["nom_long"],
      mode: json["mode"],
      resCom: json["res_com"],
      idRefLigC: json["idrefligc"],
      idRedLda: json["id_ref_lda"] ?? 0.0,
      coordinates: LatLng(json["geo_point_2d"][0], json["geo_point_2d"][1]),
    );
  }
}
