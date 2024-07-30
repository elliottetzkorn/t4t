import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/login_sheet.dart';
import 'package:t4t/design_system/system_divider.dart';
import 'package:t4t/design_system/system_icon_button.dart';
import 'package:t4t/enums/sub_pages_enum.dart';
import 'package:t4t/extensions/sub_pages_extensions.dart';
import 'package:t4t/constants.dart';

class BottomNavUnauthenticated extends ConsumerWidget {
  const BottomNavUnauthenticated({super.key, required this.postsController});

  final ScrollController postsController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      const SystemDivider(),
      Padding(
          padding: const EdgeInsets.symmetric(vertical: spacingFour),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SystemIconButton(
              icon: SubPagesEnum.posts.icon(),
              filledIcon: SubPagesEnum.posts.iconFilled(),
              focused: true,
              onPressed: () => {
                postsController.animateTo(0,
                    duration: const Duration(milliseconds: animationDuration),
                    curve: animationCurve)
              },
            ),
            SystemIconButton(
              notifColors: [Theme.of(context).colorScheme.error],
              icon: PhosphorIcons.egg_crack_thin,
              filledIcon: PhosphorIcons.egg_crack_fill,
              onPressed: () => {LoginSheet(context: context).show()},
            ),
          ]))
    ]);
  }
}
