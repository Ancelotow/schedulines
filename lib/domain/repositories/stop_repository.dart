import 'package:t_paris/domain/models/entities/stop.dart';

abstract class StopRepository {

  Future<List<Stop>> getStops();

}