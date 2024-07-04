// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'confetti_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConfettiData {
  DwellingConfettiSource get source => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConfettiDataCopyWith<ConfettiData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfettiDataCopyWith<$Res> {
  factory $ConfettiDataCopyWith(
          ConfettiData value, $Res Function(ConfettiData) then) =
      _$ConfettiDataCopyWithImpl<$Res, ConfettiData>;
  @useResult
  $Res call({DwellingConfettiSource source});
}

/// @nodoc
class _$ConfettiDataCopyWithImpl<$Res, $Val extends ConfettiData>
    implements $ConfettiDataCopyWith<$Res> {
  _$ConfettiDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as DwellingConfettiSource,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfettiDataImplCopyWith<$Res>
    implements $ConfettiDataCopyWith<$Res> {
  factory _$$ConfettiDataImplCopyWith(
          _$ConfettiDataImpl value, $Res Function(_$ConfettiDataImpl) then) =
      __$$ConfettiDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DwellingConfettiSource source});
}

/// @nodoc
class __$$ConfettiDataImplCopyWithImpl<$Res>
    extends _$ConfettiDataCopyWithImpl<$Res, _$ConfettiDataImpl>
    implements _$$ConfettiDataImplCopyWith<$Res> {
  __$$ConfettiDataImplCopyWithImpl(
      _$ConfettiDataImpl _value, $Res Function(_$ConfettiDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
  }) {
    return _then(_$ConfettiDataImpl(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as DwellingConfettiSource,
    ));
  }
}

/// @nodoc

class _$ConfettiDataImpl implements _ConfettiData {
  const _$ConfettiDataImpl({required this.source});

  @override
  final DwellingConfettiSource source;

  @override
  String toString() {
    return 'ConfettiData(source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfettiDataImpl &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfettiDataImplCopyWith<_$ConfettiDataImpl> get copyWith =>
      __$$ConfettiDataImplCopyWithImpl<_$ConfettiDataImpl>(this, _$identity);
}

abstract class _ConfettiData implements ConfettiData {
  const factory _ConfettiData({required final DwellingConfettiSource source}) =
      _$ConfettiDataImpl;

  @override
  DwellingConfettiSource get source;
  @override
  @JsonKey(ignore: true)
  _$$ConfettiDataImplCopyWith<_$ConfettiDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
