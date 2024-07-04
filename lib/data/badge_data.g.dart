// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BadgeDataImpl _$$BadgeDataImplFromJson(Map<String, dynamic> json) =>
    _$BadgeDataImpl(
      id: (json['id'] as num).toInt(),
      text: json['text'] as String,
      color: const ColorConverter().fromJson(json['color'] as String),
    );

Map<String, dynamic> _$$BadgeDataImplToJson(_$BadgeDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'color': const ColorConverter().toJson(instance.color),
    };
