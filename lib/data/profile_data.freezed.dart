// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) {
  return _ProfileData.fromJson(json);
}

/// @nodoc
mixin _$ProfileData {
  String get id => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  bool get supporter => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get color => throw _privateConstructorUsedError;
  String? get pronouns => throw _privateConstructorUsedError;
  String? get race => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  DateTime? get birthday => throw _privateConstructorUsedError;
  @BadgeListConverter()
  List<BadgeData>? get badges => throw _privateConstructorUsedError;
  String? get neighborhood => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get fcmToken => throw _privateConstructorUsedError;
  bool get showSupporter => throw _privateConstructorUsedError;
  bool get banned => throw _privateConstructorUsedError;
  bool get likeNotif => throw _privateConstructorUsedError;
  bool get messageNotif => throw _privateConstructorUsedError;
  bool get followNotif => throw _privateConstructorUsedError;
  bool get showAstro => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileDataCopyWith<ProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDataCopyWith<$Res> {
  factory $ProfileDataCopyWith(
          ProfileData value, $Res Function(ProfileData) then) =
      _$ProfileDataCopyWithImpl<$Res, ProfileData>;
  @useResult
  $Res call(
      {String id,
      String? username,
      bool supporter,
      @ColorConverter() Color color,
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
      bool showSupporter,
      bool banned,
      bool likeNotif,
      bool messageNotif,
      bool followNotif,
      bool showAstro});
}

/// @nodoc
class _$ProfileDataCopyWithImpl<$Res, $Val extends ProfileData>
    implements $ProfileDataCopyWith<$Res> {
  _$ProfileDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = freezed,
    Object? supporter = null,
    Object? color = null,
    Object? pronouns = freezed,
    Object? race = freezed,
    Object? bio = freezed,
    Object? birthday = freezed,
    Object? badges = freezed,
    Object? neighborhood = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? fcmToken = freezed,
    Object? showSupporter = null,
    Object? banned = null,
    Object? likeNotif = null,
    Object? messageNotif = null,
    Object? followNotif = null,
    Object? showAstro = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      supporter: null == supporter
          ? _value.supporter
          : supporter // ignore: cast_nullable_to_non_nullable
              as bool,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      pronouns: freezed == pronouns
          ? _value.pronouns
          : pronouns // ignore: cast_nullable_to_non_nullable
              as String?,
      race: freezed == race
          ? _value.race
          : race // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      badges: freezed == badges
          ? _value.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<BadgeData>?,
      neighborhood: freezed == neighborhood
          ? _value.neighborhood
          : neighborhood // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      showSupporter: null == showSupporter
          ? _value.showSupporter
          : showSupporter // ignore: cast_nullable_to_non_nullable
              as bool,
      banned: null == banned
          ? _value.banned
          : banned // ignore: cast_nullable_to_non_nullable
              as bool,
      likeNotif: null == likeNotif
          ? _value.likeNotif
          : likeNotif // ignore: cast_nullable_to_non_nullable
              as bool,
      messageNotif: null == messageNotif
          ? _value.messageNotif
          : messageNotif // ignore: cast_nullable_to_non_nullable
              as bool,
      followNotif: null == followNotif
          ? _value.followNotif
          : followNotif // ignore: cast_nullable_to_non_nullable
              as bool,
      showAstro: null == showAstro
          ? _value.showAstro
          : showAstro // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileDataImplCopyWith<$Res>
    implements $ProfileDataCopyWith<$Res> {
  factory _$$ProfileDataImplCopyWith(
          _$ProfileDataImpl value, $Res Function(_$ProfileDataImpl) then) =
      __$$ProfileDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? username,
      bool supporter,
      @ColorConverter() Color color,
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
      bool showSupporter,
      bool banned,
      bool likeNotif,
      bool messageNotif,
      bool followNotif,
      bool showAstro});
}

/// @nodoc
class __$$ProfileDataImplCopyWithImpl<$Res>
    extends _$ProfileDataCopyWithImpl<$Res, _$ProfileDataImpl>
    implements _$$ProfileDataImplCopyWith<$Res> {
  __$$ProfileDataImplCopyWithImpl(
      _$ProfileDataImpl _value, $Res Function(_$ProfileDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = freezed,
    Object? supporter = null,
    Object? color = null,
    Object? pronouns = freezed,
    Object? race = freezed,
    Object? bio = freezed,
    Object? birthday = freezed,
    Object? badges = freezed,
    Object? neighborhood = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? fcmToken = freezed,
    Object? showSupporter = null,
    Object? banned = null,
    Object? likeNotif = null,
    Object? messageNotif = null,
    Object? followNotif = null,
    Object? showAstro = null,
  }) {
    return _then(_$ProfileDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      supporter: null == supporter
          ? _value.supporter
          : supporter // ignore: cast_nullable_to_non_nullable
              as bool,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      pronouns: freezed == pronouns
          ? _value.pronouns
          : pronouns // ignore: cast_nullable_to_non_nullable
              as String?,
      race: freezed == race
          ? _value.race
          : race // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      badges: freezed == badges
          ? _value._badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<BadgeData>?,
      neighborhood: freezed == neighborhood
          ? _value.neighborhood
          : neighborhood // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      showSupporter: null == showSupporter
          ? _value.showSupporter
          : showSupporter // ignore: cast_nullable_to_non_nullable
              as bool,
      banned: null == banned
          ? _value.banned
          : banned // ignore: cast_nullable_to_non_nullable
              as bool,
      likeNotif: null == likeNotif
          ? _value.likeNotif
          : likeNotif // ignore: cast_nullable_to_non_nullable
              as bool,
      messageNotif: null == messageNotif
          ? _value.messageNotif
          : messageNotif // ignore: cast_nullable_to_non_nullable
              as bool,
      followNotif: null == followNotif
          ? _value.followNotif
          : followNotif // ignore: cast_nullable_to_non_nullable
              as bool,
      showAstro: null == showAstro
          ? _value.showAstro
          : showAstro // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ProfileDataImpl implements _ProfileData {
  const _$ProfileDataImpl(
      {required this.id,
      this.username,
      required this.supporter,
      @ColorConverter() required this.color,
      this.pronouns,
      this.race,
      this.bio,
      this.birthday,
      @BadgeListConverter() final List<BadgeData>? badges,
      this.neighborhood,
      this.city,
      this.state,
      this.country,
      this.fcmToken,
      required this.showSupporter,
      required this.banned,
      required this.likeNotif,
      required this.messageNotif,
      required this.followNotif,
      required this.showAstro})
      : _badges = badges;

  factory _$ProfileDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileDataImplFromJson(json);

  @override
  final String id;
  @override
  final String? username;
  @override
  final bool supporter;
  @override
  @ColorConverter()
  final Color color;
  @override
  final String? pronouns;
  @override
  final String? race;
  @override
  final String? bio;
  @override
  final DateTime? birthday;
  final List<BadgeData>? _badges;
  @override
  @BadgeListConverter()
  List<BadgeData>? get badges {
    final value = _badges;
    if (value == null) return null;
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? neighborhood;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? country;
  @override
  final String? fcmToken;
  @override
  final bool showSupporter;
  @override
  final bool banned;
  @override
  final bool likeNotif;
  @override
  final bool messageNotif;
  @override
  final bool followNotif;
  @override
  final bool showAstro;

  @override
  String toString() {
    return 'ProfileData(id: $id, username: $username, supporter: $supporter, color: $color, pronouns: $pronouns, race: $race, bio: $bio, birthday: $birthday, badges: $badges, neighborhood: $neighborhood, city: $city, state: $state, country: $country, fcmToken: $fcmToken, showSupporter: $showSupporter, banned: $banned, likeNotif: $likeNotif, messageNotif: $messageNotif, followNotif: $followNotif, showAstro: $showAstro)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.supporter, supporter) ||
                other.supporter == supporter) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.pronouns, pronouns) ||
                other.pronouns == pronouns) &&
            (identical(other.race, race) || other.race == race) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            const DeepCollectionEquality().equals(other._badges, _badges) &&
            (identical(other.neighborhood, neighborhood) ||
                other.neighborhood == neighborhood) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.showSupporter, showSupporter) ||
                other.showSupporter == showSupporter) &&
            (identical(other.banned, banned) || other.banned == banned) &&
            (identical(other.likeNotif, likeNotif) ||
                other.likeNotif == likeNotif) &&
            (identical(other.messageNotif, messageNotif) ||
                other.messageNotif == messageNotif) &&
            (identical(other.followNotif, followNotif) ||
                other.followNotif == followNotif) &&
            (identical(other.showAstro, showAstro) ||
                other.showAstro == showAstro));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        username,
        supporter,
        color,
        pronouns,
        race,
        bio,
        birthday,
        const DeepCollectionEquality().hash(_badges),
        neighborhood,
        city,
        state,
        country,
        fcmToken,
        showSupporter,
        banned,
        likeNotif,
        messageNotif,
        followNotif,
        showAstro
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileDataImplCopyWith<_$ProfileDataImpl> get copyWith =>
      __$$ProfileDataImplCopyWithImpl<_$ProfileDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileDataImplToJson(
      this,
    );
  }
}

abstract class _ProfileData implements ProfileData {
  const factory _ProfileData(
      {required final String id,
      final String? username,
      required final bool supporter,
      @ColorConverter() required final Color color,
      final String? pronouns,
      final String? race,
      final String? bio,
      final DateTime? birthday,
      @BadgeListConverter() final List<BadgeData>? badges,
      final String? neighborhood,
      final String? city,
      final String? state,
      final String? country,
      final String? fcmToken,
      required final bool showSupporter,
      required final bool banned,
      required final bool likeNotif,
      required final bool messageNotif,
      required final bool followNotif,
      required final bool showAstro}) = _$ProfileDataImpl;

  factory _ProfileData.fromJson(Map<String, dynamic> json) =
      _$ProfileDataImpl.fromJson;

  @override
  String get id;
  @override
  String? get username;
  @override
  bool get supporter;
  @override
  @ColorConverter()
  Color get color;
  @override
  String? get pronouns;
  @override
  String? get race;
  @override
  String? get bio;
  @override
  DateTime? get birthday;
  @override
  @BadgeListConverter()
  List<BadgeData>? get badges;
  @override
  String? get neighborhood;
  @override
  String? get city;
  @override
  String? get state;
  @override
  String? get country;
  @override
  String? get fcmToken;
  @override
  bool get showSupporter;
  @override
  bool get banned;
  @override
  bool get likeNotif;
  @override
  bool get messageNotif;
  @override
  bool get followNotif;
  @override
  bool get showAstro;
  @override
  @JsonKey(ignore: true)
  _$$ProfileDataImplCopyWith<_$ProfileDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
