import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:t4t/design_system/system_button.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton(
      {super.key,
      this.continueText,
      required this.onPressed,
      this.enabled = true,
      this.inverse = false,
      this.finish = false});

  final String? continueText;
  final VoidCallback onPressed;
  final bool enabled;
  final bool inverse;
  final bool finish;

  @override
  Widget build(BuildContext context) {
    return SystemButton(
        text: continueText == null
            ? AppLocalizations.of(context)!.continue_button
            : continueText!,
        enabled: enabled,
        icon: finish ? PhosphorIcons.check : PhosphorIcons.arrow_right_thin,
        flipIcon: true,
        onPressed: onPressed);
  }
}
