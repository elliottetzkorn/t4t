import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/design_system/system_text_button.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/constants.dart';

class SystemError extends StatelessWidget {
  const SystemError({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        SystemText(
            text: AppLocalizations.of(context)!.error_title,
            size: TextSizeEnum.twelve),
        const SizedBox(
          height: spacingThree,
        ),
        SystemTextButton(
            text: AppLocalizations.of(context)!.error_cta,
            onPressed: () => onPressed())
      ],
    ));
  }
}
