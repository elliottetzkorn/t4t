import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/design_system/system_button.dart';

class SaveButton extends StatelessWidget {
  const SaveButton(
      {super.key,
      required this.saving,
      required this.enabled,
      required this.onPressed,
      this.icon});

  final bool saving;
  final bool enabled;
  final VoidCallback onPressed;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SystemButton(
            moreImpactful: true,
            text: !enabled
                ? AppLocalizations.of(context)!.save_button_no_changes
                : saving
                    ? AppLocalizations.of(context)!.save_button_saving
                    : AppLocalizations.of(context)!.save_button_save,
            enabled: enabled,
            onPressed: onPressed));
  }
}
