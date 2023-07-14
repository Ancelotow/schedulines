import 'package:t_paris/domain/extensions/hex_color.dart';
import 'package:t_paris/domain/models/adapter/line_asset_adapter.dart';
import 'package:t_paris/domain/models/entities/line.dart';
import '../../../data/dto/responses/dataset_lines_response.dart';

class LineMapper {
  static List<Line> fromDatasetLineResponse(
      List<DatasetLinesResponse> dataset) {
    final lines = <Line>[];
    for (var data in dataset) {
      lines.add(Line(
        name: data.fields.name,
        idRef: data.fields.idLine,
        color: HexColor.fromHex(data.fields.colorHex),
        operatorName: data.fields.operatorName,
        operatorRef: data.fields.operatorRef,
        isAccessible: data.fields.accessibility,
        asset: LineAssetAdapter.getAsset(data.fields),
        mode: data.fields.mode,
        networkName: data.fields.networkName,
        fullName: data.fields.fullName
      ));
    }
    return lines;
  }
}
