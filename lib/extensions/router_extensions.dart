import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/confetti_data.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/design_system/system_confetti.dart';
import 'package:t4t/extensions/profile_extensions.dart';
import 'package:t4t/providers/confetti_provider.dart';

extension Navigation on GoRouter {
  void toProfileSetup(ProfileData profile, WidgetRef ref) {
    if (profile.ageIncomplete()) {
      replaceNamed(routeSetupAge, extra: profile);
    } else if (profile.usernameIncomplete()) {
      replaceNamed(routeSetupUsername, extra: profile);
    } else if (profile.pronounsIncomplete()) {
      replaceNamed(routeSetupPronouns, extra: profile);
    } else if (profile.badgesIncomplete()) {
      replaceNamed(routeSetupBadges, extra: profile);
    } else if (profile.raceIncomplete()) {
      replaceNamed(routeSetupRace, extra: profile);
    } else if (profile.bioIncomplete()) {
      replaceNamed(routeSetupBio, extra: profile);
    } else if (profile.locationIncomplete()) {
      replaceNamed(routeSetupLocation, extra: profile);
    } else {
      ref.read(confettiProvider.notifier).showConfetti(
          const ConfettiData(source: DwellingConfettiSource.setup));
      replaceNamed(routeHome);
    }
  }
}
