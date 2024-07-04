// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageData _$MessageDataFromJson(Map<String, dynamic> json) {
  return _MessageData.fromJson(json);
}

/// @nodoc
mixin _$MessageData {
  int? get id => throw _privateConstructorUsedError;
  String? get tempId => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String get receiverId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get read => throw _privateConstructorUsedError;
  String? get postTitle => throw _privateConstructorUsedError;
  String? get postBody => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageDataCopyWith<MessageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageDataCopyWith<$Res> {
  factory $MessageDataCopyWith(
          MessageData value, $Res Function(MessageData) then) =
      _$MessageDataCopyWithImpl<$Res, MessageData>;
  @useResult
  $Res call(
      {int? id,
      String? tempId,
      String text,
      String senderId,
      String receiverId,
      DateTime createdAt,
      bool read,
      String? postTitle,
      String? postBody});
}

/// @nodoc
class _$MessageDataCopyWithImpl<$Res, $Val extends MessageData>
    implements $MessageDataCopyWith<$Res> {
  _$MessageDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? tempId = freezed,
    Object? text = null,
    Object? senderId = null,
    Object? receiverId = null,
    Object? createdAt = null,
    Object? read = null,
    Object? postTitle = freezed,
    Object? postBody = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      tempId: freezed == tempId
          ? _value.tempId
          : tempId // ignore: cast_nullable_to_non_nullable
              as String?,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      postTitle: freezed == postTitle
          ? _value.postTitle
          : postTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      postBody: freezed == postBody
          ? _value.postBody
          : postBody // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageDataImplCopyWith<$Res>
    implements $MessageDataCopyWith<$Res> {
  factory _$$MessageDataImplCopyWith(
          _$MessageDataImpl value, $Res Function(_$MessageDataImpl) then) =
      __$$MessageDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? tempId,
      String text,
      String senderId,
      String receiverId,
      DateTime createdAt,
      bool read,
      String? postTitle,
      String? postBody});
}

/// @nodoc
class __$$MessageDataImplCopyWithImpl<$Res>
    extends _$MessageDataCopyWithImpl<$Res, _$MessageDataImpl>
    implements _$$MessageDataImplCopyWith<$Res> {
  __$$MessageDataImplCopyWithImpl(
      _$MessageDataImpl _value, $Res Function(_$MessageDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? tempId = freezed,
    Object? text = null,
    Object? senderId = null,
    Object? receiverId = null,
    Object? createdAt = null,
    Object? read = null,
    Object? postTitle = freezed,
    Object? postBody = freezed,
  }) {
    return _then(_$MessageDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      tempId: freezed == tempId
          ? _value.tempId
          : tempId // ignore: cast_nullable_to_non_nullable
              as String?,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      postTitle: freezed == postTitle
          ? _value.postTitle
          : postTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      postBody: freezed == postBody
          ? _value.postBody
          : postBody // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$MessageDataImpl implements _MessageData {
  const _$MessageDataImpl(
      {this.id,
      this.tempId,
      required this.text,
      required this.senderId,
      required this.receiverId,
      required this.createdAt,
      required this.read,
      this.postTitle,
      this.postBody});

  factory _$MessageDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageDataImplFromJson(json);

  @override
  final int? id;
  @override
  final String? tempId;
  @override
  final String text;
  @override
  final String senderId;
  @override
  final String receiverId;
  @override
  final DateTime createdAt;
  @override
  final bool read;
  @override
  final String? postTitle;
  @override
  final String? postBody;

  @override
  String toString() {
    return 'MessageData(id: $id, tempId: $tempId, text: $text, senderId: $senderId, receiverId: $receiverId, createdAt: $createdAt, read: $read, postTitle: $postTitle, postBody: $postBody)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tempId, tempId) || other.tempId == tempId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.read, read) || other.read == read) &&
            (identical(other.postTitle, postTitle) ||
                other.postTitle == postTitle) &&
            (identical(other.postBody, postBody) ||
                other.postBody == postBody));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, tempId, text, senderId,
      receiverId, createdAt, read, postTitle, postBody);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageDataImplCopyWith<_$MessageDataImpl> get copyWith =>
      __$$MessageDataImplCopyWithImpl<_$MessageDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageDataImplToJson(
      this,
    );
  }
}

abstract class _MessageData implements MessageData {
  const factory _MessageData(
      {final int? id,
      final String? tempId,
      required final String text,
      required final String senderId,
      required final String receiverId,
      required final DateTime createdAt,
      required final bool read,
      final String? postTitle,
      final String? postBody}) = _$MessageDataImpl;

  factory _MessageData.fromJson(Map<String, dynamic> json) =
      _$MessageDataImpl.fromJson;

  @override
  int? get id;
  @override
  String? get tempId;
  @override
  String get text;
  @override
  String get senderId;
  @override
  String get receiverId;
  @override
  DateTime get createdAt;
  @override
  bool get read;
  @override
  String? get postTitle;
  @override
  String? get postBody;
  @override
  @JsonKey(ignore: true)
  _$$MessageDataImplCopyWith<_$MessageDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
