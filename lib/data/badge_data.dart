import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:t4t/converters/color_converter.dart';

part 'badge_data.freezed.dart';
part 'badge_data.g.dart';

@freezed
class BadgeData with _$BadgeData {
  const factory BadgeData(
      {required int id,
      required String text,
      @ColorConverter() required Color color}) = _BadgeData;

  factory BadgeData.fromJson(Map<String, dynamic> json) =>
      _$BadgeDataFromJson(json);
}
