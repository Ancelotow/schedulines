import 'package:t_paris/domain/models/dto/responses/stop_response.dart';

class DatasetStopResponse {
  final String recordId;
  final StopResponse fields;

  DatasetStopResponse({
    required this.recordId,
    required this.fields,
  });

  factory DatasetStopResponse.fromJson(Map<String, dynamic> json) {
    return DatasetStopResponse(
      recordId: json["recordid"],
      fields: StopResponse.fromJson(json["fields"]),
    );
  }
}
