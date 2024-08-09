// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SystemThemeData {
  DarkColorThemeEnum get darkTheme => throw _privateConstructorUsedError;
  LightColorThemeEnum get lightTheme => throw _privateConstructorUsedError;
  ThemeMode get mode => throw _privateConstructorUsedError;

  /// Create a copy of SystemThemeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SystemThemeDataCopyWith<SystemThemeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemThemeDataCopyWith<$Res> {
  factory $SystemThemeDataCopyWith(
          SystemThemeData value, $Res Function(SystemThemeData) then) =
      _$SystemThemeDataCopyWithImpl<$Res, SystemThemeData>;
  @useResult
  $Res call(
      {DarkColorThemeEnum darkTheme,
      LightColorThemeEnum lightTheme,
      ThemeMode mode});
}

/// @nodoc
class _$SystemThemeDataCopyWithImpl<$Res, $Val extends SystemThemeData>
    implements $SystemThemeDataCopyWith<$Res> {
  _$SystemThemeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SystemThemeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? darkTheme = null,
    Object? lightTheme = null,
    Object? mode = null,
  }) {
    return _then(_value.copyWith(
      darkTheme: null == darkTheme
          ? _value.darkTheme
          : darkTheme // ignore: cast_nullable_to_non_nullable
              as DarkColorThemeEnum,
      lightTheme: null == lightTheme
          ? _value.lightTheme
          : lightTheme // ignore: cast_nullable_to_non_nullable
              as LightColorThemeEnum,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SystemThemeDataImplCopyWith<$Res>
    implements $SystemThemeDataCopyWith<$Res> {
  factory _$$SystemThemeDataImplCopyWith(_$SystemThemeDataImpl value,
          $Res Function(_$SystemThemeDataImpl) then) =
      __$$SystemThemeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DarkColorThemeEnum darkTheme,
      LightColorThemeEnum lightTheme,
      ThemeMode mode});
}

/// @nodoc
class __$$SystemThemeDataImplCopyWithImpl<$Res>
    extends _$SystemThemeDataCopyWithImpl<$Res, _$SystemThemeDataImpl>
    implements _$$SystemThemeDataImplCopyWith<$Res> {
  __$$SystemThemeDataImplCopyWithImpl(
      _$SystemThemeDataImpl _value, $Res Function(_$SystemThemeDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SystemThemeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? darkTheme = null,
    Object? lightTheme = null,
    Object? mode = null,
  }) {
    return _then(_$SystemThemeDataImpl(
      darkTheme: null == darkTheme
          ? _value.darkTheme
          : darkTheme // ignore: cast_nullable_to_non_nullable
              as DarkColorThemeEnum,
      lightTheme: null == lightTheme
          ? _value.lightTheme
          : lightTheme // ignore: cast_nullable_to_non_nullable
              as LightColorThemeEnum,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc

class _$SystemThemeDataImpl implements _SystemThemeData {
  const _$SystemThemeDataImpl(
      {required this.darkTheme, required this.lightTheme, required this.mode});

  @override
  final DarkColorThemeEnum darkTheme;
  @override
  final LightColorThemeEnum lightTheme;
  @override
  final ThemeMode mode;

  @override
  String toString() {
    return 'SystemThemeData(darkTheme: $darkTheme, lightTheme: $lightTheme, mode: $mode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SystemThemeDataImpl &&
            (identical(other.darkTheme, darkTheme) ||
                other.darkTheme == darkTheme) &&
            (identical(other.lightTheme, lightTheme) ||
                other.lightTheme == lightTheme) &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, darkTheme, lightTheme, mode);

  /// Create a copy of SystemThemeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SystemThemeDataImplCopyWith<_$SystemThemeDataImpl> get copyWith =>
      __$$SystemThemeDataImplCopyWithImpl<_$SystemThemeDataImpl>(
          this, _$identity);
}

abstract class _SystemThemeData implements SystemThemeData {
  const factory _SystemThemeData(
      {required final DarkColorThemeEnum darkTheme,
      required final LightColorThemeEnum lightTheme,
      required final ThemeMode mode}) = _$SystemThemeDataImpl;

  @override
  DarkColorThemeEnum get darkTheme;
  @override
  LightColorThemeEnum get lightTheme;
  @override
  ThemeMode get mode;

  /// Create a copy of SystemThemeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SystemThemeDataImplCopyWith<_$SystemThemeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
