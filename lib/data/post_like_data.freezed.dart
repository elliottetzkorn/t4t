// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_like_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostLikeData _$PostLikeDataFromJson(Map<String, dynamic> json) {
  return _PostLikeData.fromJson(json);
}

/// @nodoc
mixin _$PostLikeData {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  bool get supporter => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get color => throw _privateConstructorUsedError;
  String get likeTypeText => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this PostLikeData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostLikeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostLikeDataCopyWith<PostLikeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostLikeDataCopyWith<$Res> {
  factory $PostLikeDataCopyWith(
          PostLikeData value, $Res Function(PostLikeData) then) =
      _$PostLikeDataCopyWithImpl<$Res, PostLikeData>;
  @useResult
  $Res call(
      {String id,
      String username,
      bool supporter,
      @ColorConverter() Color color,
      String likeTypeText,
      DateTime createdAt});
}

/// @nodoc
class _$PostLikeDataCopyWithImpl<$Res, $Val extends PostLikeData>
    implements $PostLikeDataCopyWith<$Res> {
  _$PostLikeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostLikeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? supporter = null,
    Object? color = null,
    Object? likeTypeText = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      supporter: null == supporter
          ? _value.supporter
          : supporter // ignore: cast_nullable_to_non_nullable
              as bool,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      likeTypeText: null == likeTypeText
          ? _value.likeTypeText
          : likeTypeText // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostLikeDataImplCopyWith<$Res>
    implements $PostLikeDataCopyWith<$Res> {
  factory _$$PostLikeDataImplCopyWith(
          _$PostLikeDataImpl value, $Res Function(_$PostLikeDataImpl) then) =
      __$$PostLikeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String username,
      bool supporter,
      @ColorConverter() Color color,
      String likeTypeText,
      DateTime createdAt});
}

/// @nodoc
class __$$PostLikeDataImplCopyWithImpl<$Res>
    extends _$PostLikeDataCopyWithImpl<$Res, _$PostLikeDataImpl>
    implements _$$PostLikeDataImplCopyWith<$Res> {
  __$$PostLikeDataImplCopyWithImpl(
      _$PostLikeDataImpl _value, $Res Function(_$PostLikeDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostLikeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? supporter = null,
    Object? color = null,
    Object? likeTypeText = null,
    Object? createdAt = null,
  }) {
    return _then(_$PostLikeDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      supporter: null == supporter
          ? _value.supporter
          : supporter // ignore: cast_nullable_to_non_nullable
              as bool,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      likeTypeText: null == likeTypeText
          ? _value.likeTypeText
          : likeTypeText // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$PostLikeDataImpl implements _PostLikeData {
  const _$PostLikeDataImpl(
      {required this.id,
      required this.username,
      required this.supporter,
      @ColorConverter() required this.color,
      required this.likeTypeText,
      required this.createdAt});

  factory _$PostLikeDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostLikeDataImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final bool supporter;
  @override
  @ColorConverter()
  final Color color;
  @override
  final String likeTypeText;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'PostLikeData(id: $id, username: $username, supporter: $supporter, color: $color, likeTypeText: $likeTypeText, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostLikeDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.supporter, supporter) ||
                other.supporter == supporter) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.likeTypeText, likeTypeText) ||
                other.likeTypeText == likeTypeText) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, username, supporter, color, likeTypeText, createdAt);

  /// Create a copy of PostLikeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostLikeDataImplCopyWith<_$PostLikeDataImpl> get copyWith =>
      __$$PostLikeDataImplCopyWithImpl<_$PostLikeDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostLikeDataImplToJson(
      this,
    );
  }
}

abstract class _PostLikeData implements PostLikeData {
  const factory _PostLikeData(
      {required final String id,
      required final String username,
      required final bool supporter,
      @ColorConverter() required final Color color,
      required final String likeTypeText,
      required final DateTime createdAt}) = _$PostLikeDataImpl;

  factory _PostLikeData.fromJson(Map<String, dynamic> json) =
      _$PostLikeDataImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  bool get supporter;
  @override
  @ColorConverter()
  Color get color;
  @override
  String get likeTypeText;
  @override
  DateTime get createdAt;

  /// Create a copy of PostLikeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostLikeDataImplCopyWith<_$PostLikeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
