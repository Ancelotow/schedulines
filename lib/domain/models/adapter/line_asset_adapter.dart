import '../../../data/dto/responses/line_response.dart';

class LineAssetAdapter {

  static String getAsset(LineResponse line) {
    switch(line.mode.toLowerCase()) {
      case "metro":
        return "assets/icons/metro/metro_${line.name}_couleur_RVB.svg";

      case "tram":
        return "assets/icons/tram/tram_${line.name}_carto_RVB.svg";

      case "rail":
        if(line.networkName.toLowerCase() == "transilien") {
          return "assets/icons/train/train_${line.name}_couleur_RVB.svg";
        } else if(line.networkName.toLowerCase() == "rer") {
          return "assets/icons/rer/RER_${line.name}_couleur_RVB.svg";
        } else {
          return "";
        }

      default:
        return "";
    }
  }

}