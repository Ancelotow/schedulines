import 'package:t_paris/domain/models/dto/responses/dataset_lines_response.dart';
import 'package:t_paris/utils/data_state.dart';

abstract class TransportLineRepository {

  Future<DataState<List<DatasetLinesResponse>>> getLines();

}