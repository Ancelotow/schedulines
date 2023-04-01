import 'package:t_paris/domain/models/dto/responses/dataset_stop_response.dart';
import 'package:t_paris/utils/data_state.dart';

abstract class TransportStopRepository {

  Future<DataState<List<DatasetStopResponse>>> getStops();

}