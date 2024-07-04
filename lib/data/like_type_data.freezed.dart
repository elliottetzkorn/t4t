// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'like_type_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LikeTypeData {
  int get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LikeTypeDataCopyWith<LikeTypeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeTypeDataCopyWith<$Res> {
  factory $LikeTypeDataCopyWith(
          LikeTypeData value, $Res Function(LikeTypeData) then) =
      _$LikeTypeDataCopyWithImpl<$Res, LikeTypeData>;
  @useResult
  $Res call({int id, String text});
}

/// @nodoc
class _$LikeTypeDataCopyWithImpl<$Res, $Val extends LikeTypeData>
    implements $LikeTypeDataCopyWith<$Res> {
  _$LikeTypeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LikeTypeDataImplCopyWith<$Res>
    implements $LikeTypeDataCopyWith<$Res> {
  factory _$$LikeTypeDataImplCopyWith(
          _$LikeTypeDataImpl value, $Res Function(_$LikeTypeDataImpl) then) =
      __$$LikeTypeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String text});
}

/// @nodoc
class __$$LikeTypeDataImplCopyWithImpl<$Res>
    extends _$LikeTypeDataCopyWithImpl<$Res, _$LikeTypeDataImpl>
    implements _$$LikeTypeDataImplCopyWith<$Res> {
  __$$LikeTypeDataImplCopyWithImpl(
      _$LikeTypeDataImpl _value, $Res Function(_$LikeTypeDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
  }) {
    return _then(_$LikeTypeDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LikeTypeDataImpl implements _LikeTypeData {
  const _$LikeTypeDataImpl({required this.id, required this.text});

  @override
  final int id;
  @override
  final String text;

  @override
  String toString() {
    return 'LikeTypeData(id: $id, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeTypeDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeTypeDataImplCopyWith<_$LikeTypeDataImpl> get copyWith =>
      __$$LikeTypeDataImplCopyWithImpl<_$LikeTypeDataImpl>(this, _$identity);
}

abstract class _LikeTypeData implements LikeTypeData {
  const factory _LikeTypeData(
      {required final int id, required final String text}) = _$LikeTypeDataImpl;

  @override
  int get id;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$LikeTypeDataImplCopyWith<_$LikeTypeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
