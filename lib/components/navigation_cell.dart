import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/system_tap.dart';
import 'package:t4t/components/title_subtitle.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/utils/device_utils.dart';

class NavigationCell extends ConsumerWidget {
  const NavigationCell(
      {super.key,
      required this.title,
      required this.subTitle,
      this.icon = PhosphorIcons.arrow_right_thin,
      required this.onPressed,
      this.embedded = false,
      this.notification = false});
  final String title;
  final String subTitle;
  final IconData icon;
  final VoidCallback onPressed;
  final bool embedded;
  final bool notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SystemTap(
        onTap: () => onPressed(),
        child: Container(
            padding: const EdgeInsets.all(spacingFive),
            child: Row(children: [
              Expanded(
                child: TitleSubtitle(
                    title: title, subTitle: subTitle, isNav: true),
              ),
              if (!embedded || !DeviceUtils.isTablet(context))
                Row(children: [
                  const SizedBox(width: spacingFive),
                  Icon(icon, color: Theme.of(context).colorScheme.primary)
                ])
            ])));
  }
}
