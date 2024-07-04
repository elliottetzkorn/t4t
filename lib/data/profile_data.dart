import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:t4t/converters/badge_list_converter.dart';
import 'package:t4t/converters/color_converter.dart';
import 'package:t4t/data/badge_data.dart';

part 'profile_data.freezed.dart';
part 'profile_data.g.dart';

@freezed
class ProfileData with _$ProfileData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ProfileData(
      {required String id,
      String? username,
      required bool supporter,
      @ColorConverter() required Color color,
      String? pronouns,
      String? race,
      String? bio,
      DateTime? birthday,
      @BadgeListConverter() List<BadgeData>? badges,
      String? neighborhood,
      String? city,
      String? state,
      String? country,
      String? fcmToken,
      required bool showSupporter,
      required bool banned,
      required bool likeNotif,
      required bool messageNotif,
      required bool followNotif,
      required bool showAstro}) = _ProfileData;

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
}
