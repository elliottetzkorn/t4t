import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/extensions/color_extensions.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/providers/resolved_brightness_provider.dart';

class SystemBadge extends ConsumerWidget {
  const SystemBadge({super.key, required this.colors});

  final List<Color> colors;

  double dimenForLength() {
    switch (colors.length) {
      case 3:
      case 2:
        return notifDimenSmall;
      case 1:
      default:
        return notifDimenBig;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        for (Color color in colors)
          Padding(
              padding: const EdgeInsets.only(bottom: spacingTwo),
              child: Container(
                width: dimenForLength(),
                height: dimenForLength(),
                decoration: BoxDecoration(
                  color: color.adjusted(ref.watch(resolvedBrightnessProvider)),
                  shape: BoxShape.circle,
                ),
              ))
      ],
    );
  }
}
