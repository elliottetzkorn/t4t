import 'package:flutter/material.dart';
import 'package:t4t/components/system_tap.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/constants.dart';

class SystemTextButton extends StatelessWidget {
  const SystemTextButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.profile,
      this.enabled = true,
      this.underlined = true,
      this.light = false});

  final String text;
  final VoidCallback onPressed;
  final ProfileData? profile;
  final bool enabled;
  final bool underlined;
  final bool light;

  @override
  Widget build(BuildContext context) {
    return SystemTap(
        onTap: () => enabled ? onPressed() : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: buttonWidthPadding, vertical: buttonHeightPadding),
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: SystemText(
                underline: underlined,
                text: text,
                color: light
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.primary,
                size: TextSizeEnum.fifteen,
              )),
        ));
  }
}
