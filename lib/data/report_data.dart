import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_data.freezed.dart';
part 'report_data.g.dart';

@freezed
class ReportData with _$ReportData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ReportData({
    required String receiverId,
    required List<String> senderIds,
  }) = _ReportData;

  factory ReportData.fromJson(Map<String, dynamic> json) =>
      _$ReportDataFromJson(json);
}
