import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_type_data.freezed.dart';

@freezed
class LikeTypeData with _$LikeTypeData {
  const factory LikeTypeData({required int id, required String text}) =
      _LikeTypeData;
}
