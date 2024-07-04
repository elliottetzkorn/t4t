// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filters_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FiltersData {
  int get distance => throw _privateConstructorUsedError;
  List<int> get badges => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;
  int get minAge => throw _privateConstructorUsedError;
  int get maxAge => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FiltersDataCopyWith<FiltersData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FiltersDataCopyWith<$Res> {
  factory $FiltersDataCopyWith(
          FiltersData value, $Res Function(FiltersData) then) =
      _$FiltersDataCopyWithImpl<$Res, FiltersData>;
  @useResult
  $Res call({int distance, List<int> badges, int type, int minAge, int maxAge});
}

/// @nodoc
class _$FiltersDataCopyWithImpl<$Res, $Val extends FiltersData>
    implements $FiltersDataCopyWith<$Res> {
  _$FiltersDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = null,
    Object? badges = null,
    Object? type = null,
    Object? minAge = null,
    Object? maxAge = null,
  }) {
    return _then(_value.copyWith(
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
      badges: null == badges
          ? _value.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<int>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      minAge: null == minAge
          ? _value.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as int,
      maxAge: null == maxAge
          ? _value.maxAge
          : maxAge // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FiltersDataImplCopyWith<$Res>
    implements $FiltersDataCopyWith<$Res> {
  factory _$$FiltersDataImplCopyWith(
          _$FiltersDataImpl value, $Res Function(_$FiltersDataImpl) then) =
      __$$FiltersDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int distance, List<int> badges, int type, int minAge, int maxAge});
}

/// @nodoc
class __$$FiltersDataImplCopyWithImpl<$Res>
    extends _$FiltersDataCopyWithImpl<$Res, _$FiltersDataImpl>
    implements _$$FiltersDataImplCopyWith<$Res> {
  __$$FiltersDataImplCopyWithImpl(
      _$FiltersDataImpl _value, $Res Function(_$FiltersDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = null,
    Object? badges = null,
    Object? type = null,
    Object? minAge = null,
    Object? maxAge = null,
  }) {
    return _then(_$FiltersDataImpl(
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
      badges: null == badges
          ? _value._badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<int>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      minAge: null == minAge
          ? _value.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as int,
      maxAge: null == maxAge
          ? _value.maxAge
          : maxAge // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FiltersDataImpl implements _FiltersData {
  const _$FiltersDataImpl(
      {required this.distance,
      required final List<int> badges,
      required this.type,
      required this.minAge,
      required this.maxAge})
      : _badges = badges;

  @override
  final int distance;
  final List<int> _badges;
  @override
  List<int> get badges {
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_badges);
  }

  @override
  final int type;
  @override
  final int minAge;
  @override
  final int maxAge;

  @override
  String toString() {
    return 'FiltersData(distance: $distance, badges: $badges, type: $type, minAge: $minAge, maxAge: $maxAge)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FiltersDataImpl &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            const DeepCollectionEquality().equals(other._badges, _badges) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.minAge, minAge) || other.minAge == minAge) &&
            (identical(other.maxAge, maxAge) || other.maxAge == maxAge));
  }

  @override
  int get hashCode => Object.hash(runtimeType, distance,
      const DeepCollectionEquality().hash(_badges), type, minAge, maxAge);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FiltersDataImplCopyWith<_$FiltersDataImpl> get copyWith =>
      __$$FiltersDataImplCopyWithImpl<_$FiltersDataImpl>(this, _$identity);
}

abstract class _FiltersData implements FiltersData {
  const factory _FiltersData(
      {required final int distance,
      required final List<int> badges,
      required final int type,
      required final int minAge,
      required final int maxAge}) = _$FiltersDataImpl;

  @override
  int get distance;
  @override
  List<int> get badges;
  @override
  int get type;
  @override
  int get minAge;
  @override
  int get maxAge;
  @override
  @JsonKey(ignore: true)
  _$$FiltersDataImplCopyWith<_$FiltersDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
