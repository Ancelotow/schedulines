import 'package:t_paris/domain/models/dto/responses/line_response.dart';

class DatasetLinesResponse {
  final String recordId;
  final LineResponse fields;

  DatasetLinesResponse({
    required this.recordId,
    required this.fields,
  });

  factory DatasetLinesResponse.fromJson(Map<String, dynamic> json) {
    return DatasetLinesResponse(
      recordId: json["recordid"],
      fields: LineResponse.fromJson(json["fields"]),
    );
  }
}
