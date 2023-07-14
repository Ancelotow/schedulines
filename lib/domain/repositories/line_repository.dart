import '../models/entities/line.dart';

abstract class LineRepository {

  Future<List<Line>> getLines();

}