// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_type_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostTypeData {
  int get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  /// Create a copy of PostTypeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostTypeDataCopyWith<PostTypeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostTypeDataCopyWith<$Res> {
  factory $PostTypeDataCopyWith(
          PostTypeData value, $Res Function(PostTypeData) then) =
      _$PostTypeDataCopyWithImpl<$Res, PostTypeData>;
  @useResult
  $Res call({int id, String text});
}

/// @nodoc
class _$PostTypeDataCopyWithImpl<$Res, $Val extends PostTypeData>
    implements $PostTypeDataCopyWith<$Res> {
  _$PostTypeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostTypeData
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$PostTypeDataImplCopyWith<$Res>
    implements $PostTypeDataCopyWith<$Res> {
  factory _$$PostTypeDataImplCopyWith(
          _$PostTypeDataImpl value, $Res Function(_$PostTypeDataImpl) then) =
      __$$PostTypeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String text});
}

/// @nodoc
class __$$PostTypeDataImplCopyWithImpl<$Res>
    extends _$PostTypeDataCopyWithImpl<$Res, _$PostTypeDataImpl>
    implements _$$PostTypeDataImplCopyWith<$Res> {
  __$$PostTypeDataImplCopyWithImpl(
      _$PostTypeDataImpl _value, $Res Function(_$PostTypeDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostTypeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
  }) {
    return _then(_$PostTypeDataImpl(
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

class _$PostTypeDataImpl implements _PostTypeData {
  const _$PostTypeDataImpl({required this.id, required this.text});

  @override
  final int id;
  @override
  final String text;

  @override
  String toString() {
    return 'PostTypeData(id: $id, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostTypeDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, text);

  /// Create a copy of PostTypeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostTypeDataImplCopyWith<_$PostTypeDataImpl> get copyWith =>
      __$$PostTypeDataImplCopyWithImpl<_$PostTypeDataImpl>(this, _$identity);
}

abstract class _PostTypeData implements PostTypeData {
  const factory _PostTypeData(
      {required final int id, required final String text}) = _$PostTypeDataImpl;

  @override
  int get id;
  @override
  String get text;

  /// Create a copy of PostTypeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostTypeDataImplCopyWith<_$PostTypeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
