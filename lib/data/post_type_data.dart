import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_type_data.freezed.dart';

@freezed
class PostTypeData with _$PostTypeData {
  const factory PostTypeData({required int id, required String text}) =
      _PostTypeData;
}
