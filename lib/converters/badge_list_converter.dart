import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:t4t/data/badge_data.dart';

class BadgeListConverter implements JsonConverter<List<BadgeData>, dynamic> {
  const BadgeListConverter();

  @override
  List<BadgeData> fromJson(dynamic value) {
    return value
        .map<BadgeData>((data) => BadgeData.fromJson(data['badge_type']))
        .toList(growable: false);
  }

  @override
  String toJson(List<BadgeData> value) => value.toString();
}
