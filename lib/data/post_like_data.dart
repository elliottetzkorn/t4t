import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:t4t/converters/color_converter.dart';

part 'post_like_data.freezed.dart';
part 'post_like_data.g.dart';

@freezed
class PostLikeData with _$PostLikeData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PostLikeData(
      {required String id,
      required String username,
      required bool supporter,
      @ColorConverter() required Color color,
      required String likeTypeText,
      required DateTime createdAt}) = _PostLikeData;

  factory PostLikeData.fromJson(Map<String, dynamic> json) =>
      _$PostLikeDataFromJson(json);
}
