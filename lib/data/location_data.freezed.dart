// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocationData {
  Position get position => throw _privateConstructorUsedError;
  String? get neighborhoodName => throw _privateConstructorUsedError;
  String? get cityName => throw _privateConstructorUsedError;
  String? get stateName => throw _privateConstructorUsedError;
  String? get countryName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationDataCopyWith<LocationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationDataCopyWith<$Res> {
  factory $LocationDataCopyWith(
          LocationData value, $Res Function(LocationData) then) =
      _$LocationDataCopyWithImpl<$Res, LocationData>;
  @useResult
  $Res call(
      {Position position,
      String? neighborhoodName,
      String? cityName,
      String? stateName,
      String? countryName});
}

/// @nodoc
class _$LocationDataCopyWithImpl<$Res, $Val extends LocationData>
    implements $LocationDataCopyWith<$Res> {
  _$LocationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? neighborhoodName = freezed,
    Object? cityName = freezed,
    Object? stateName = freezed,
    Object? countryName = freezed,
  }) {
    return _then(_value.copyWith(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
      neighborhoodName: freezed == neighborhoodName
          ? _value.neighborhoodName
          : neighborhoodName // ignore: cast_nullable_to_non_nullable
              as String?,
      cityName: freezed == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
      stateName: freezed == stateName
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryName: freezed == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationDataImplCopyWith<$Res>
    implements $LocationDataCopyWith<$Res> {
  factory _$$LocationDataImplCopyWith(
          _$LocationDataImpl value, $Res Function(_$LocationDataImpl) then) =
      __$$LocationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Position position,
      String? neighborhoodName,
      String? cityName,
      String? stateName,
      String? countryName});
}

/// @nodoc
class __$$LocationDataImplCopyWithImpl<$Res>
    extends _$LocationDataCopyWithImpl<$Res, _$LocationDataImpl>
    implements _$$LocationDataImplCopyWith<$Res> {
  __$$LocationDataImplCopyWithImpl(
      _$LocationDataImpl _value, $Res Function(_$LocationDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? neighborhoodName = freezed,
    Object? cityName = freezed,
    Object? stateName = freezed,
    Object? countryName = freezed,
  }) {
    return _then(_$LocationDataImpl(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
      neighborhoodName: freezed == neighborhoodName
          ? _value.neighborhoodName
          : neighborhoodName // ignore: cast_nullable_to_non_nullable
              as String?,
      cityName: freezed == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
      stateName: freezed == stateName
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryName: freezed == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LocationDataImpl implements _LocationData {
  const _$LocationDataImpl(
      {required this.position,
      this.neighborhoodName,
      this.cityName,
      this.stateName,
      this.countryName});

  @override
  final Position position;
  @override
  final String? neighborhoodName;
  @override
  final String? cityName;
  @override
  final String? stateName;
  @override
  final String? countryName;

  @override
  String toString() {
    return 'LocationData(position: $position, neighborhoodName: $neighborhoodName, cityName: $cityName, stateName: $stateName, countryName: $countryName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationDataImpl &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.neighborhoodName, neighborhoodName) ||
                other.neighborhoodName == neighborhoodName) &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            (identical(other.stateName, stateName) ||
                other.stateName == stateName) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position, neighborhoodName,
      cityName, stateName, countryName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationDataImplCopyWith<_$LocationDataImpl> get copyWith =>
      __$$LocationDataImplCopyWithImpl<_$LocationDataImpl>(this, _$identity);
}

abstract class _LocationData implements LocationData {
  const factory _LocationData(
      {required final Position position,
      final String? neighborhoodName,
      final String? cityName,
      final String? stateName,
      final String? countryName}) = _$LocationDataImpl;

  @override
  Position get position;
  @override
  String? get neighborhoodName;
  @override
  String? get cityName;
  @override
  String? get stateName;
  @override
  String? get countryName;
  @override
  @JsonKey(ignore: true)
  _$$LocationDataImplCopyWith<_$LocationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
