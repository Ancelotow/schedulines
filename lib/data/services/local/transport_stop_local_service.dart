import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:t_paris/domain/models/dto/responses/dataset_stop_response.dart';

class TransportStopLocalService {

  Future<List<DatasetStopResponse>> getStops() async {
    final result = await rootBundle.loadString('assets/json/stops.json');
    final data = json.decode(result) as List<dynamic>;
    final stops = <DatasetStopResponse>[];
    for(var dataset in data) {
      stops.add(DatasetStopResponse.fromJson(dataset));
    }
    return  stops;
  }

}