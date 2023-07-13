import 'package:t_paris/data/services/local/transport_line_local_service.dart';
import 'package:t_paris/domain/repositories/transport_line_repository.dart';
import 'package:t_paris/utils/data_state.dart';
import '../../dto/responses/dataset_lines_response.dart';

class TransportLineLocalRepository implements TransportLineRepository {

  final TransportLineLocalService _service;

  TransportLineLocalRepository(this._service);

  @override
  Future<DataState<List<DatasetLinesResponse>>> getLines() async {
    try {
      final stops = await _service.getLines();
      return DataStateSuccess(stops);
    } on Exception catch(e) {
      return DataStateError(e);
    }
  }

}