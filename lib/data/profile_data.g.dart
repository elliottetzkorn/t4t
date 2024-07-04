// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileDataImpl _$$ProfileDataImplFromJson(Map<String, dynamic> json) =>
    _$ProfileDataImpl(
      id: json['id'] as String,
      username: json['username'] as String?,
      supporter: json['supporter'] as bool,
      color: const ColorConverter().fromJson(json['color'] as String),
      pronouns: json['pronouns'] as String?,
      race: json['race'] as String?,
      bio: json['bio'] as String?,
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      badges: const BadgeListConverter().fromJson(json['badges']),
      neighborhood: json['neighborhood'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      fcmToken: json['fcm_token'] as String?,
      showSupporter: json['show_supporter'] as bool,
      banned: json['banned'] as bool,
      likeNotif: json['like_notif'] as bool,
      messageNotif: json['message_notif'] as bool,
      followNotif: json['follow_notif'] as bool,
      showAstro: json['show_astro'] as bool,
    );

Map<String, dynamic> _$$ProfileDataImplToJson(_$ProfileDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'supporter': instance.supporter,
      'color': const ColorConverter().toJson(instance.color),
      'pronouns': instance.pronouns,
      'race': instance.race,
      'bio': instance.bio,
      'birthday': instance.birthday?.toIso8601String(),
      'badges': _$JsonConverterToJson<dynamic, List<BadgeData>>(
          instance.badges, const BadgeListConverter().toJson),
      'neighborhood': instance.neighborhood,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'fcm_token': instance.fcmToken,
      'show_supporter': instance.showSupporter,
      'banned': instance.banned,
      'like_notif': instance.likeNotif,
      'message_notif': instance.messageNotif,
      'follow_notif': instance.followNotif,
      'show_astro': instance.showAstro,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
