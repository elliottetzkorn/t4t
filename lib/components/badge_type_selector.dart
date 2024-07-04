import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/badge_data.dart';
import 'package:t4t/design_system/system_check_box.dart';
import 'package:t4t/extensions/color_extensions.dart';
import 'package:t4t/providers/resolved_brightness_provider.dart';

class BadgeTypeSelector extends ConsumerWidget {
  const BadgeTypeSelector(
      {super.key, required this.onTapped, required this.currentBadges});

  final Function onTapped;
  final Iterable<int> currentBadges;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
        alignment: WrapAlignment.start,
        spacing: spacingFour,
        runSpacing: spacingFour,
        children: <Widget>[
          for (BadgeData badge in availableBadges)
            SystemCheckBox(
              color:
                  badge.color.adjusted(ref.watch(resolvedBrightnessProvider)),
              text: badge.text,
              selected: currentBadges.any((id) => id == badge.id),
              onPressed: () => onTapped(badge),
            ),
        ]);
  }
}
