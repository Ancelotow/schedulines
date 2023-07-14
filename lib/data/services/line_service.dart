import '../dto/responses/dataset_lines_response.dart';

abstract class LineService {

  Future<List<DatasetLinesResponse>> getLines();

}