import 'package:t_paris/utils/data_state.dart';
import '../../data/dto/responses/dataset_lines_response.dart';

abstract class TransportLineRepository {

  Future<DataState<List<DatasetLinesResponse>>> getLines();

}