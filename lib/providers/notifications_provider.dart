import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/data/notif_data.dart';
import 'package:t4t/enums/sub_pages_enum.dart';
import 'package:t4t/providers/profile_provider.dart';
import 'package:t4t/providers/tab_provider.dart';
import 'package:t4t/repositories/notifications_repository.dart';

part 'notifications_provider.g.dart';

@riverpod
class Notifications extends _$Notifications {
  bool _isPolling = false;

  @override
  Future<List<NotifData>> build() async {
    final id = await ref.read(profileProvider.selectAsync((data) => data.id));
    final response = await NotificationsRepository.fetch(id);

    return response.map<NotifData>((data) => NotifData.fromMap(data)).toList();
  }

  Future<void> scroll() async {
    final List<NotifData> notifications = await future;

    if (notifications.isNotEmpty) {
      final id = await ref.read(profileProvider.selectAsync((data) => data.id));

      final response = await NotificationsRepository.fetchBeforeDateTime(
          id, notifications.last.createdAt);

      if (response.isNotEmpty) {
        notifications
            .addAll(response.map<NotifData>((data) => NotifData.fromMap(data)));

        state = AsyncData(notifications);
      }
    }
  }

  Future<void> poll(bool initial) async {
    if (_isPolling) {
      return;
    }

    _isPolling = true;

    final tab = ref.read(tabProvider);
    final id = await ref.read(profileProvider.selectAsync((data) => data.id));

    if (initial || tab != SubPagesEnum.notifications) {
      final List<NotifData> notifications = await future;

      if (notifications.isNotEmpty) {
        final response = await NotificationsRepository.fetchAfterDateTime(
            id, notifications.first.createdAt);

        if (response.isNotEmpty) {
          notifications.insertAll(
              0, response.map<NotifData>((data) => NotifData.fromMap(data)));

          state = AsyncData(notifications);
        }
      } else {
        ref.invalidateSelf();
      }
    }

    _isPolling = false;
  }

  Future<void> changeTitle(int postId, String newTitle) async {
    final List<NotifData> notifications = await future;

    if (notifications.any((post) => post.post.id == postId)) {
      notifications.firstWhere((post) => post.post.id == postId).post.title =
          newTitle;

      state = AsyncData(notifications);
    }
  }

  Future<void> removeNotif(int postId) async {
    final List<NotifData> notifications = await future;

    notifications.removeWhere((post) => post.post.id == postId);

    state = AsyncData(notifications);
  }

  Future<void> removeBlockedUser(String userId) async {
    final List<NotifData> notifications = await future;

    notifications.removeWhere((element) => element.profile.id == userId);

    state = AsyncData(notifications);
  }
}
