import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/data/message_data.dart';
import 'package:t4t/extensions/strings_extensions.dart';
import 'package:t4t/providers/profile_provider.dart';
import 'package:t4t/repositories/messages_repository.dart';

part 'messages_provider.g.dart';

@riverpod
class Messages extends _$Messages {
  @override
  Future<List<MessageData>> build(String profileId) async {
    final id = await ref.read(profileProvider.selectAsync((data) => data.id));
    final response = await MessagesRepository.fetch(id, profileId);

    return response
        .map<MessageData>((data) => MessageData.fromJson(data))
        .toList();
  }

  Future<void> add(MessageData message) async {
    final List<MessageData> messages = await future;

    messages.insert(0, message);
    state = AsyncData(messages);
  }

  Future<void> updateMessage(MessageData message) async {
    final List<MessageData> messages = await future;

    if (message.tempId != null) {
      final index =
          messages.indexWhere((element) => element.tempId == message.tempId);

      if (index != -1) {
        messages[index] = message;
        state = AsyncData(messages);
      }
    }
  }

  Future<void> remove(MessageData message) async {
    final List<MessageData> messages = await future;

    messages.remove(message);
    state = AsyncData(messages);
  }

  Future<void> delete(MessageData message) async {
    if (message.id != null) {
      await MessagesRepository.delete(message.id!);
      remove(message);
    }
  }

  Future<void> scroll(String profileId) async {
    final List<MessageData> messages = await future;
    final id = await ref.read(profileProvider.selectAsync((data) => data.id));

    final response = await MessagesRepository.fetchBeforeDateTime(
        id, profileId, messages.last.createdAt);

    messages.addAll(
        response.map<MessageData>((data) => MessageData.fromJson(data)));

    state = AsyncData(messages);
  }

  Future<void> poll(String profileId) async {
    final List<MessageData> messages = await future;

    if (messages.isNotEmpty) {
      final id = await ref.read(profileProvider.selectAsync((data) => data.id));

      final response = await MessagesRepository.fetchAfterDateTime(
          id, profileId, messages.first.createdAt);

      final messagesTemp =
          response.map<MessageData>((data) => MessageData.fromJson(data));

      if (messagesTemp.isNotEmpty) {
        messages.insertAll(0, messagesTemp);

        state = AsyncData(messages);
      }
    }
  }

  Future<void> pollRead(String profileId) async {
    final List<MessageData> messages = await future;

    if (messages.first.id != null &&
        messages.first.senderId.isOwnId() &&
        messages.first.read == false) {
      final response = await MessagesRepository.isRead(messages.first.id!);

      if (response['read'] == true) {
        messages.first = messages.first.copyWith(read: true);
        state = AsyncData(messages);
      }
    }
  }
}
