import 'package:t_paris/data/services/line_service.dart';
import 'package:t_paris/data/services/local/line_local_service.dart';
import 'package:t_paris/domain/repositories/line_repository.dart';
import '../../../domain/models/entities/line.dart';
import '../../../domain/models/mappers/line_mapper.dart';

class LineLocalRepository implements LineRepository {

  final LineService _service;

  LineLocalRepository(this._service);

  @override
  Future<List<Line>> getLines() async {
    final stops = await _service.getLines();
    return LineMapper.fromDatasetLineResponse(stops);
  }

}