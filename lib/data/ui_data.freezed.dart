// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ui_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UIData {
  bool get onboardingConfetti => throw _privateConstructorUsedError;
  bool get supporterConfetti => throw _privateConstructorUsedError;

  /// Create a copy of UIData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UIDataCopyWith<UIData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UIDataCopyWith<$Res> {
  factory $UIDataCopyWith(UIData value, $Res Function(UIData) then) =
      _$UIDataCopyWithImpl<$Res, UIData>;
  @useResult
  $Res call({bool onboardingConfetti, bool supporterConfetti});
}

/// @nodoc
class _$UIDataCopyWithImpl<$Res, $Val extends UIData>
    implements $UIDataCopyWith<$Res> {
  _$UIDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UIData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onboardingConfetti = null,
    Object? supporterConfetti = null,
  }) {
    return _then(_value.copyWith(
      onboardingConfetti: null == onboardingConfetti
          ? _value.onboardingConfetti
          : onboardingConfetti // ignore: cast_nullable_to_non_nullable
              as bool,
      supporterConfetti: null == supporterConfetti
          ? _value.supporterConfetti
          : supporterConfetti // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UIDataImplCopyWith<$Res> implements $UIDataCopyWith<$Res> {
  factory _$$UIDataImplCopyWith(
          _$UIDataImpl value, $Res Function(_$UIDataImpl) then) =
      __$$UIDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool onboardingConfetti, bool supporterConfetti});
}

/// @nodoc
class __$$UIDataImplCopyWithImpl<$Res>
    extends _$UIDataCopyWithImpl<$Res, _$UIDataImpl>
    implements _$$UIDataImplCopyWith<$Res> {
  __$$UIDataImplCopyWithImpl(
      _$UIDataImpl _value, $Res Function(_$UIDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UIData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onboardingConfetti = null,
    Object? supporterConfetti = null,
  }) {
    return _then(_$UIDataImpl(
      onboardingConfetti: null == onboardingConfetti
          ? _value.onboardingConfetti
          : onboardingConfetti // ignore: cast_nullable_to_non_nullable
              as bool,
      supporterConfetti: null == supporterConfetti
          ? _value.supporterConfetti
          : supporterConfetti // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UIDataImpl implements _UIData {
  const _$UIDataImpl(
      {required this.onboardingConfetti, required this.supporterConfetti});

  @override
  final bool onboardingConfetti;
  @override
  final bool supporterConfetti;

  @override
  String toString() {
    return 'UIData(onboardingConfetti: $onboardingConfetti, supporterConfetti: $supporterConfetti)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UIDataImpl &&
            (identical(other.onboardingConfetti, onboardingConfetti) ||
                other.onboardingConfetti == onboardingConfetti) &&
            (identical(other.supporterConfetti, supporterConfetti) ||
                other.supporterConfetti == supporterConfetti));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, onboardingConfetti, supporterConfetti);

  /// Create a copy of UIData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UIDataImplCopyWith<_$UIDataImpl> get copyWith =>
      __$$UIDataImplCopyWithImpl<_$UIDataImpl>(this, _$identity);
}

abstract class _UIData implements UIData {
  const factory _UIData(
      {required final bool onboardingConfetti,
      required final bool supporterConfetti}) = _$UIDataImpl;

  @override
  bool get onboardingConfetti;
  @override
  bool get supporterConfetti;

  /// Create a copy of UIData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UIDataImplCopyWith<_$UIDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
