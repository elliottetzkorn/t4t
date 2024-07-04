// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_like_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostLikeDataImpl _$$PostLikeDataImplFromJson(Map<String, dynamic> json) =>
    _$PostLikeDataImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      supporter: json['supporter'] as bool,
      color: const ColorConverter().fromJson(json['color'] as String),
      likeTypeText: json['like_type_text'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$PostLikeDataImplToJson(_$PostLikeDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'supporter': instance.supporter,
      'color': const ColorConverter().toJson(instance.color),
      'like_type_text': instance.likeTypeText,
      'created_at': instance.createdAt.toIso8601String(),
    };
