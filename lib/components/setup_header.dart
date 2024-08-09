import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/extensions/profile_extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SetupHeader extends ConsumerWidget {
  const SetupHeader({super.key, this.closable = false, required this.profile});

  final bool closable;
  final ProfileData profile;

  static int numberOfOnboardingStepsLeft(ProfileData profile) {
    int steps = 0;

    if (profile.ageIncomplete()) steps++;
    if (profile.usernameIncomplete()) steps++;
    if (profile.pronounsIncomplete()) steps++;
    if (profile.badgesIncomplete()) steps++;
    if (profile.raceIncomplete()) steps++;
    if (profile.bioIncomplete()) steps++;
    if (profile.locationIncomplete()) steps++;

    return steps;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final steps = numberOfOnboardingStepsLeft(profile) - 1;
    String stepsString;
    if (steps <= 0) {
      stepsString = AppLocalizations.of(context)!.setup_step_left;
    } else if (steps == 1) {
      stepsString = AppLocalizations.of(context)!.setup_one_step_left;
    } else {
      stepsString = AppLocalizations.of(context)!.setup_steps_left(steps);
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SystemText(
        text: stepsString,
        color: Theme.of(context).colorScheme.secondary,
      ),
    ]);
  }
}
