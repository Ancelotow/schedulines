import 'dart:convert';
import 'package:flutter/services.dart';
import '../../dto/responses/dataset_lines_response.dart';
import '../line_service.dart';

class LineLocalService implements LineService {

  @override
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