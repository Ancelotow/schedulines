import 'package:t_paris/domain/models/dto/responses/dataset_stop_response.dart';
import 'package:t_paris/domain/models/entities/stop.dart';

class StopAdapter {
  static List<Stop> fromListDatasetStopResponse(
      List<DatasetStopResponse> responses) {
    final stops = <Stop>[];
    for (var response in responses) {
      stops.add(fromDatasetStopResponse(response));
    }
    return stops;
  }

  static Stop fromDatasetStopResponse(DatasetStopResponse response) {
    return Stop(
      name: response.fields.label,
      operator: response.fields.exploitant,
      idRef: response.fields.idRedLda.round().toString(),
      coordinates: response.fields.coordinates,
      lines: response.fields.resCom.split("/").toList(),
      modes: response.fields.mode.split("/").toList(),
      isMetroTerminus: response.fields.termtro == "1",
      isTrainTerminus: response.fields.tertrain == "1",
    );
  }
}
