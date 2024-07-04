// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'badge_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BadgeData _$BadgeDataFromJson(Map<String, dynamic> json) {
  return _BadgeData.fromJson(json);
}

/// @nodoc
mixin _$BadgeData {
  int get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BadgeDataCopyWith<BadgeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BadgeDataCopyWith<$Res> {
  factory $BadgeDataCopyWith(BadgeData value, $Res Function(BadgeData) then) =
      _$BadgeDataCopyWithImpl<$Res, BadgeData>;
  @useResult
  $Res call({int id, String text, @ColorConverter() Color color});
}

/// @nodoc
class _$BadgeDataCopyWithImpl<$Res, $Val extends BadgeData>
    implements $BadgeDataCopyWith<$Res> {
  _$BadgeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BadgeDataImplCopyWith<$Res>
    implements $BadgeDataCopyWith<$Res> {
  factory _$$BadgeDataImplCopyWith(
          _$BadgeDataImpl value, $Res Function(_$BadgeDataImpl) then) =
      __$$BadgeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String text, @ColorConverter() Color color});
}

/// @nodoc
class __$$BadgeDataImplCopyWithImpl<$Res>
    extends _$BadgeDataCopyWithImpl<$Res, _$BadgeDataImpl>
    implements _$$BadgeDataImplCopyWith<$Res> {
  __$$BadgeDataImplCopyWithImpl(
      _$BadgeDataImpl _value, $Res Function(_$BadgeDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? color = null,
  }) {
    return _then(_$BadgeDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BadgeDataImpl implements _BadgeData {
  const _$BadgeDataImpl(
      {required this.id,
      required this.text,
      @ColorConverter() required this.color});

  factory _$BadgeDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BadgeDataImplFromJson(json);

  @override
  final int id;
  @override
  final String text;
  @override
  @ColorConverter()
  final Color color;

  @override
  String toString() {
    return 'BadgeData(id: $id, text: $text, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadgeDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BadgeDataImplCopyWith<_$BadgeDataImpl> get copyWith =>
      __$$BadgeDataImplCopyWithImpl<_$BadgeDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BadgeDataImplToJson(
      this,
    );
  }
}

abstract class _BadgeData implements BadgeData {
  const factory _BadgeData(
      {required final int id,
      required final String text,
      @ColorConverter() required final Color color}) = _$BadgeDataImpl;

  factory _BadgeData.fromJson(Map<String, dynamic> json) =
      _$BadgeDataImpl.fromJson;

  @override
  int get id;
  @override
  String get text;
  @override
  @ColorConverter()
  Color get color;
  @override
  @JsonKey(ignore: true)
  _$$BadgeDataImplCopyWith<_$BadgeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
