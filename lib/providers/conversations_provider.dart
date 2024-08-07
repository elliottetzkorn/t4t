import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/data/conversation_data.dart';
import 'package:t4t/data/profile_min_data.dart';
import 'package:t4t/repositories/conversations_repository.dart';

part 'conversations_provider.g.dart';

@riverpod
class Conversations extends _$Conversations {
  bool _isPolling = false;

  @override
  Future<List<ConversationData>> build() async {
    final response = await ConversationsRepository.fetch();

    return response
        .map<ConversationData>((data) => ConversationData.fromMap(map: data))
        .toList();
  }

  Future<void> scroll() async {
    final List<ConversationData> conversations = await future;

    if (conversations.isNotEmpty) {
      final response = await ConversationsRepository.fetchBeforeDateTime(
          conversations.last.lastMessageCreatedAt);

      if (response.isNotEmpty) {
        conversations.addAll(response.map<ConversationData>(
            (data) => ConversationData.fromMap(map: data)));

        state = AsyncData(conversations);
      }
    }
  }

  Future<void> poll() async {
    if (_isPolling) return;

    _isPolling = true;

    final List<ConversationData> conversations = await future;

    if (conversations.isNotEmpty) {
      final response = await ConversationsRepository.fetchAfterDateTime(
          conversations.first.lastMessageCreatedAt);

      if (response.isNotEmpty) {
        final messagesTemp =
            response.map<ConversationData>((data) => ConversationData.fromMap(
                  map: data,
                ));

        for (ConversationData tempConversation in messagesTemp) {
          if (conversations.any(
              (element) => element.profile.id == tempConversation.profile.id)) {
            int i = conversations.indexWhere(
                (element) => element.profile.id == tempConversation.profile.id);

            conversations[i] = tempConversation;
          } else {
            if (conversations.indexWhere((conversation) =>
                    conversation.profile.id == tempConversation.profile.id) ==
                -1) {
              conversations.insert(0, tempConversation);
            }
          }
        }

        conversations.sort(
            (a, b) => b.lastMessageCreatedAt.compareTo(a.lastMessageCreatedAt));

        state = AsyncData(conversations);
      }
    } else {
      ref.invalidateSelf();
    }

    _isPolling = false;
  }

  Future<void> messageSent(ProfileMinData profile, String text) async {
    final List<ConversationData> conversations = await future;

    final int i =
        conversations.indexWhere((element) => element.profile.id == profile.id);

    if (i != -1) {
      conversations.removeAt(i);
    }

    conversations.insert(
        0,
        ConversationData(
            profile: profile,
            text: text,
            unread: false,
            lastMessageCreatedAt: DateTime.now().toUtc()));

    state = AsyncData(conversations);
  }

  Future<void> removeBlockedUser(String profileId) async {
    final List<ConversationData> conversations = await future;

    conversations.removeWhere((element) => element.profile.id == profileId);

    state = AsyncData(conversations);
  }

  Future<void> delete(String profileId) async {
    final List<ConversationData> conversations = await future;

    await ConversationsRepository.delete(profileId);

    conversations.removeWhere((element) => element.profile.id == profileId);

    state = AsyncData(conversations);
  }
}
