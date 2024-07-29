import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/nav_bar_button.dart';
import 'package:t4t/design_system/system_divider.dart';
import 'package:t4t/design_system/system_icon_button.dart';
import 'package:t4t/design_system/system_sheet.dart';
import 'package:t4t/enums/sub_pages_enum.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/pages/new_post_page.dart';
import 'package:t4t/providers/background_provider.dart';

class BottomNavAuthenticated extends ConsumerWidget {
  const BottomNavAuthenticated(
      {super.key,
      required this.pageController,
      required this.postsController,
      required this.conversationsController,
      required this.notificationsController,
      required this.profileController});

  final PageController pageController;
  final ScrollController postsController;
  final ScrollController conversationsController;
  final ScrollController notificationsController;
  final ScrollController profileController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      const SystemDivider(),
      Padding(
          padding: const EdgeInsets.symmetric(vertical: spacingFour),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            NavBarButton(
                page: SubPagesEnum.posts,
                scrollController: postsController,
                pageController: pageController),
            SystemIconButton(
              icon: PhosphorIcons.pen_nib_thin,
              filledIcon: PhosphorIcons.pen_nib_fill,
              focused: false,
              onPressed: () => {
                ref.read(backgroundProvider.notifier).toggle(),
                SystemSheet.show(
                  maxHeightPercent: maxPercentPost,
                  context: context,
                  child: const NewPostPage(),
                  whenComplete: () {
                    ref.read(backgroundProvider.notifier).toggle();
                  },
                )
              },
            ),
            NavBarButton(
                page: SubPagesEnum.conversations,
                scrollController: conversationsController,
                pageController: pageController),
            NavBarButton(
                page: SubPagesEnum.conversations,
                scrollController: conversationsController,
                pageController: pageController),
            NavBarButton(
                page: SubPagesEnum.notifications,
                scrollController: notificationsController,
                pageController: pageController),
            NavBarButton(
                page: SubPagesEnum.profile,
                scrollController: profileController,
                pageController: pageController),
          ]))
    ]);
  }
}
