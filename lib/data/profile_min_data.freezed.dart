// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_min_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileMinData _$ProfileMinDataFromJson(Map<String, dynamic> json) {
  return _ProfileMinData.fromJson(json);
}

/// @nodoc
mixin _$ProfileMinData {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  bool get supporter => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get color => throw _privateConstructorUsedError;

  /// Serializes this ProfileMinData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileMinData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileMinDataCopyWith<ProfileMinData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileMinDataCopyWith<$Res> {
  factory $ProfileMinDataCopyWith(
          ProfileMinData value, $Res Function(ProfileMinData) then) =
      _$ProfileMinDataCopyWithImpl<$Res, ProfileMinData>;
  @useResult
  $Res call(
      {String id,
      String username,
      bool supporter,
      @ColorConverter() Color color});
}

/// @nodoc
class _$ProfileMinDataCopyWithImpl<$Res, $Val extends ProfileMinData>
    implements $ProfileMinDataCopyWith<$Res> {
  _$ProfileMinDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileMinData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? supporter = null,
    Object? color = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileMinDataImplCopyWith<$Res>
    implements $ProfileMinDataCopyWith<$Res> {
  factory _$$ProfileMinDataImplCopyWith(_$ProfileMinDataImpl value,
          $Res Function(_$ProfileMinDataImpl) then) =
      __$$ProfileMinDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String username,
      bool supporter,
      @ColorConverter() Color color});
}

/// @nodoc
class __$$ProfileMinDataImplCopyWithImpl<$Res>
    extends _$ProfileMinDataCopyWithImpl<$Res, _$ProfileMinDataImpl>
    implements _$$ProfileMinDataImplCopyWith<$Res> {
  __$$ProfileMinDataImplCopyWithImpl(
      _$ProfileMinDataImpl _value, $Res Function(_$ProfileMinDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileMinData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? supporter = null,
    Object? color = null,
  }) {
    return _then(_$ProfileMinDataImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileMinDataImpl implements _ProfileMinData {
  const _$ProfileMinDataImpl(
      {required this.id,
      this.username = '',
      required this.supporter,
      @ColorConverter() required this.color});

  factory _$ProfileMinDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileMinDataImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String username;
  @override
  final bool supporter;
  @override
  @ColorConverter()
  final Color color;

  @override
  String toString() {
    return 'ProfileMinData(id: $id, username: $username, supporter: $supporter, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileMinDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.supporter, supporter) ||
                other.supporter == supporter) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, supporter, color);

  /// Create a copy of ProfileMinData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileMinDataImplCopyWith<_$ProfileMinDataImpl> get copyWith =>
      __$$ProfileMinDataImplCopyWithImpl<_$ProfileMinDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileMinDataImplToJson(
      this,
    );
  }
}

abstract class _ProfileMinData implements ProfileMinData {
  const factory _ProfileMinData(
      {required final String id,
      final String username,
      required final bool supporter,
      @ColorConverter() required final Color color}) = _$ProfileMinDataImpl;

  factory _ProfileMinData.fromJson(Map<String, dynamic> json) =
      _$ProfileMinDataImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  bool get supporter;
  @override
  @ColorConverter()
  Color get color;

  /// Create a copy of ProfileMinData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileMinDataImplCopyWith<_$ProfileMinDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
