import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:t4t/converters/color_converter.dart';

part 'profile_min_data.freezed.dart';
part 'profile_min_data.g.dart';

@freezed
class ProfileMinData with _$ProfileMinData {
  const factory ProfileMinData(
      {required String id,
      @Default('') String username,
      required bool supporter,
      @ColorConverter() required Color color}) = _ProfileMinData;

  factory ProfileMinData.fromJson(Map<String, dynamic> json) =>
      _$ProfileMinDataFromJson(json);
}
