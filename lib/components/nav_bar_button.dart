import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/design_system/system_icon_button.dart';
import 'package:t4t/enums/sub_pages_enum.dart';
import 'package:t4t/extensions/sub_pages_extensions.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/providers/badge_colors_provider.dart';
import 'package:t4t/providers/tab_provider.dart';

class NavBarButton extends ConsumerWidget {
  const NavBarButton(
      {super.key,
      required this.page,
      required this.scrollController,
      required this.pageController});

  final SubPagesEnum page;
  final ScrollController scrollController;
  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> badgeColors =
        ref.watch(badgeColorsProvider(page).select((v) => switch (v) {
              AsyncData(:final value) => value,
              _ => const [],
            }));
    final bool focused = ref.watch(tabProvider) == page;

    return SystemIconButton(
      notifColors: badgeColors,
      icon: page.icon(),
      filledIcon: page.iconFilled(),
      focused: focused,
      onPressed: () => {
        if (focused && scrollController.hasClients)
          {
            scrollController.animateTo(0,
                duration: const Duration(milliseconds: animationDuration),
                curve: animationCurve)
          }
        else
          {
            ref.read(tabProvider.notifier).setTab(page),
            pageController.jumpToPage(page.index),
            if (page == SubPagesEnum.notifications)
              {
                ref
                    .read(badgeColorsProvider(page).notifier)
                    .resetNotificationBadgeColors()
              }
          }
      },
    );
  }
}
