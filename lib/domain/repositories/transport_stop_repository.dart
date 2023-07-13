import 'package:t_paris/utils/data_state.dart';
import '../../data/dto/responses/dataset_stop_response.dart';

abstract class TransportStopRepository {

  Future<DataState<List<DatasetStopResponse>>> getStops();

}