import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/data/message_data.dart';
import 'package:t4t/data/profile_min_data.dart';
import 'package:t4t/extensions/strings_extensions.dart';
import 'package:t4t/providers/conversations_provider.dart';
import 'package:t4t/repositories/messages_repository.dart';

part 'messages_provider.g.dart';

@riverpod
class Messages extends _$Messages {
  @override
  Future<List<MessageData>> build(String conversationId) async {
    final response = await MessagesRepository.fetch(conversationId);

    return response
        .map<MessageData>((data) => MessageData.fromJson(data))
        .toList();
  }

  Future<void> updateMessage(
      MessageData message, ProfileMinData profile) async {
    final List<MessageData> messages = await future;

    if (message.id == null) {
      messages.insert(0, message);
    } else {
      int i = messages.indexWhere((element) => element.id == message.id);

      if (i == -1) {
        messages.removeWhere((element) => element.id == null);
        messages.insert(0, message);
        ref
            .read(conversationsProvider.notifier)
            .messageSent(profile, message.text);
      } else {
        messages[i] = message;
      }

      if (!message.senderId.isOwnId() && !message.read) {
        MessagesRepository.sendRead(message.id!);
      }
    }

    state = AsyncData(messages);
  }

  Future<void> remove() async {
    final List<MessageData> messages = await future;

    messages.removeAt(0);
    state = AsyncData(messages);
  }

  Future<void> scroll(String conversationId) async {
    final List<MessageData> messages = await future;

    final response = await MessagesRepository.fetchBeforeDateTime(
        conversationId, messages.last.createdAt);

    messages.addAll(
        response.map<MessageData>((data) => MessageData.fromJson(data)));

    state = AsyncData(messages);
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
