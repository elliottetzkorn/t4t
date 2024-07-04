// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_min_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileMinDataImpl _$$ProfileMinDataImplFromJson(Map<String, dynamic> json) =>
    _$ProfileMinDataImpl(
      id: json['id'] as String,
      username: json['username'] as String? ?? '',
      supporter: json['supporter'] as bool,
      color: const ColorConverter().fromJson(json['color'] as String),
    );

Map<String, dynamic> _$$ProfileMinDataImplToJson(
        _$ProfileMinDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'supporter': instance.supporter,
      'color': const ColorConverter().toJson(instance.color),
    };
