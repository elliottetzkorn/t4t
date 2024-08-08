import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/components/supporter_sheet.dart';
import 'package:t4t/components/system_tap.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/providers/profile_provider.dart';

class SupporterCTA extends ConsumerWidget {
  const SupporterCTA({super.key, required this.authenticated});

  final bool authenticated;

  Widget supporterCta(BuildContext context, WidgetRef ref, bool supporter) {
    return SystemTap(
        onTap: supporter ? null : () => SupporterSheet().show(context, ref),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: spacingTwo),
            child: Row(
              children: [
                const SystemText(
                  text: '✨',
                ),
                SystemText(
                  color: Theme.of(context).colorScheme.error,
                  maxLines: 1,
                  underline: !supporter,
                  text: AppLocalizations.of(context)!.supporter,
                )
              ],
            )));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (authenticated) {
      final userProfile = ref.watch(profileProvider);

      return switch (userProfile) {
        AsyncData(value: final profileValue) =>
          supporterCta(context, ref, profileValue.supporter),
        _ => const SizedBox.shrink()
      };
    } else {
      return supporterCta(context, ref, true);
    }
  }
}
