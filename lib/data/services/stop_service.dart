import '../dto/responses/dataset_stop_response.dart';

abstract class StopService {

  Future<List<DatasetStopResponse>> getStops();

}