import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_data.freezed.dart';
part 'message_data.g.dart';

@freezed
class MessageData with _$MessageData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MessageData({
    int? id,
    String? tempId,
    required String text,
    required String senderId,
    required String receiverId,
    required DateTime createdAt,
    required bool read,
    String? postTitle,
    String? postBody,
  }) = _MessageData;

  factory MessageData.fromJson(Map<String, dynamic> json) =>
      _$MessageDataFromJson(json);
}
