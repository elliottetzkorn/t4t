import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/components/supporter_cta.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/profile_min_data.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/extensions/color_extensions.dart';
import 'package:t4t/extensions/strings_extensions.dart';
import 'package:t4t/providers/resolved_brightness_provider.dart';

class ProfileHeaderMin extends ConsumerWidget {
  const ProfileHeaderMin(
      {super.key, required this.profile, required this.authenticated});

  final ProfileMinData profile;
  final bool authenticated;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SystemText(
          text: '@${profile.username}',
          color: profile.color.adjusted(ref.watch(resolvedBrightnessProvider)),
        ),
        if (profile.id.isEllId())
          Padding(
              padding: const EdgeInsets.symmetric(vertical: spacingTwo),
              child: SystemText(
                color: pureBlue.adjusted(ref.watch(resolvedBrightnessProvider)),
                maxLines: 1,
                text: '🌱${AppLocalizations.of(context)!.staff}',
              )),
        if (profile.supporter && !profile.id.isEllId())
          SupporterCTA(authenticated: authenticated)
      ],
    );
  }
}
