import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/enums/sub_pages_enum.dart';
import 'package:t4t/providers/conversations_provider.dart';
import 'package:t4t/providers/notifications_provider.dart';

part 'badge_colors_provider.g.dart';

@riverpod
class BadgeColors extends _$BadgeColors {
  @override
  Future<List<Color>> build(SubPagesEnum page) async {
    List<Color> colors = List.empty(growable: true);
    int i = 0;
    int j = 0;

    switch (page) {
      case SubPagesEnum.posts:
        // await ref.watch(postsAuthenticatedProvider.future);
        // final postId = prefs.getInt(prefsLastPostTime);

        // if (postId == null) {
        //   if (posts.isNotEmpty) {
        //     prefs.setInt(prefsLastPostTime, posts.first.post.id);
        //   }
        // } else {
        //   while (i < 3 && j < posts.length) {
        //     if (posts[j].post.id > postId) {
        //       colors.add(posts[j].profile.color);
        //       i++;
        //     }
        //     j++;
        //   }
        // }
        break;

      // break;
      case SubPagesEnum.conversations:
        final conversations = await ref.watch(conversationsProvider.future);

        while (i < 3 && j < conversations.length) {
          if (conversations[j].unread) {
            colors.add(conversations[j].profile.color);
            i++;
          }
          j++;
        }

        break;
      case SubPagesEnum.notifications:
        final notifications = await ref.watch(notificationsProvider.future);

        if (notifications.isNotEmpty) {
          final threeNotifications = notifications.take(3);

          final notifId = prefs.getInt(prefsLastReactionId);

          if (notifId == null) {
            prefs.setInt(prefsLastReactionId, notifications.first.likeId!);
          }

          for (final notif in threeNotifications) {
            if (notifId == null ||
                notif.likeId != null && notif.likeId! > notifId) {
              colors.add(notif.profile.color);
            }
          }
        }

        break;
      case SubPagesEnum.profile:
        break;
    }

    return colors;
  }

  void resetNotificationBadgeColors() async {
    final notifications = await ref.read(notificationsProvider.future);

    prefs.setInt(prefsLastReactionId, notifications.first.likeId!);
    state = const AsyncData([]);
  }
}
