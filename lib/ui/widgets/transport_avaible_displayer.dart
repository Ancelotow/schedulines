import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:t_paris/domain/models/entities/stop.dart';

class TransportAvailableDisplayer extends StatelessWidget {
  final Color symbolColor;
  final Stop stop;
  final int symbolSize;
  final _symbols = <Widget>[];

  TransportAvailableDisplayer({
    Key? key,
    required this.stop,
    this.symbolColor = Colors.white,
    this.symbolSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (stop.modes.where((e) => e.toUpperCase().trim() == "RER").isNotEmpty) {
      _buildRER();
    }
    if (stop.modes.where((e) => e.toUpperCase().trim() == "METRO").isNotEmpty) {
      _symbols.add(const SizedBox(width: 15));
      _buildMetro();
    }
    if (stop.modes.where((e) => e.toUpperCase().trim() == "TRAIN").isNotEmpty) {
      _symbols.add(const SizedBox(width: 15));
      _buildTrain();
    }
    if (stop.modes.where((e) => e.toUpperCase().trim() == "TRAMWAY").isNotEmpty) {
      _symbols.add(const SizedBox(width: 15));
      _buildTram();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _symbols,
    );
  }

  void _addSymbole(String name) {
    _symbols.add(
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: SvgPicture.asset(
          name,
          width: 20,
          color: symbolColor,
        ),
      ),
    );
  }

  void _addSymboleWithoutColor(String name) {
    _symbols.add(
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: SvgPicture.asset(
          name,
          width: 20,
        ),
      ),
    );
  }

  void _buildRER() {
    _addSymbole("assets/icons/symbole_RER.svg");
    final rers = stop.lines.where((e) => e.contains("RER")).toList();
    for (var rer in rers) {
      final line = rer.replaceAll("RER", "").trim();
      _addSymboleWithoutColor("assets/icons/rer/RER_${line}_couleur_RVB.svg");
    }
  }

  void _buildMetro() {
    _addSymbole("assets/icons/symbole_metro.svg");
    final rers = stop.lines.where((e) => e.contains("METRO")).toList();
    for (var rer in rers) {
      final line = rer.replaceAll("METRO", "").trim();
      _addSymboleWithoutColor("assets/icons/metro/metro_${line}_couleur_RVB.svg");
    }
  }

  void _buildTrain() {
    _addSymbole("assets/icons/symbole_train.svg");
    final rers = stop.lines.where((e) => e.contains("TRAIN")).toList();
    for (var rer in rers) {
      final line = rer.replaceAll("TRAIN", "").trim();
      _addSymboleWithoutColor("assets/icons/train/train_${line}_couleur_RVB.svg");
    }
  }

  void _buildTram() {
    _addSymbole("assets/icons/symbole_tram.svg");
    final rers = stop.lines.where((e) => e.contains("TRAM")).toList();
    for (var rer in rers) {
      final line = rer.replaceAll("TRAM", "").trim();
      _addSymboleWithoutColor("assets/icons/tram/tram_T${line}_carto_RVB.svg");
    }
  }
}
