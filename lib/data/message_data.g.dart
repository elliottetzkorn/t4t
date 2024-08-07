// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageDataImpl _$$MessageDataImplFromJson(Map<String, dynamic> json) =>
    _$MessageDataImpl(
      id: (json['id'] as num?)?.toInt(),
      text: json['text'] as String,
      senderId: json['sender_id'] as String,
      receiverId: json['receiver_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      read: json['read'] as bool,
      postTitle: json['post_title'] as String?,
      postBody: json['post_body'] as String?,
    );

Map<String, dynamic> _$$MessageDataImplToJson(_$MessageDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'sender_id': instance.senderId,
      'receiver_id': instance.receiverId,
      'created_at': instance.createdAt.toIso8601String(),
      'read': instance.read,
      'post_title': instance.postTitle,
      'post_body': instance.postBody,
    };
