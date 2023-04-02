import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:t_paris/domain/models/dto/responses/dataset_lines_response.dart';

class TransportLineLocalService {

  Future<List<DatasetLinesResponse>> getLines() async {
    final result = await rootBundle.loadString('assets/json/lines.json');
    final data = json.decode(result) as List<dynamic>;
    final lines = <DatasetLinesResponse>[];
    for(var dataset in data) {
      lines.add(DatasetLinesResponse.fromJson(dataset));
    }
    return lines;
  }

}