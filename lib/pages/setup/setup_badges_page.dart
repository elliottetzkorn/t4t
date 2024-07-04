import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/badge_type_selector.dart';
import 'package:t4t/components/continue_button.dart';
import 'package:t4t/components/title_subtitle.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/badge_data.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/design_system/system_loader.dart';
import 'package:t4t/extensions/router_extensions.dart';
import 'package:t4t/pages/setup/setup_page.dart';
import 'package:t4t/providers/profile_provider.dart';
import 'package:t4t/providers/router_provider.dart';

class SetupBadgesPage extends ConsumerStatefulWidget {
  const SetupBadgesPage({super.key, required this.profile});

  final ProfileData profile;

  @override
  ConsumerState<SetupBadgesPage> createState() => _SetupBadgesPageState();
}

class _SetupBadgesPageState extends ConsumerState<SetupBadgesPage> {
  bool insertingBadges = false;
  bool insertingBadgesFailed = false;
  List<BadgeData> newBadgeList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
  }

  Future<void> updateBadges() async {
    setState(() => insertingBadges = true);

    await ref
        .read(profileProvider.notifier)
        .updateBadges(newBadgeList)
        .then((_) {
      ref
          .read(routerProvider)
          .toProfileSetup(widget.profile.copyWith(badges: newBadgeList), ref);
    });

    setState(() => insertingBadges = true);
  }

  void handleBadgeTap(BadgeData badgeTapped) {
    setState(() {
      if (newBadgeList.contains(badgeTapped)) {
        newBadgeList.remove(badgeTapped);
      } else {
        newBadgeList.add(badgeTapped);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: insertingBadges
            ? const SystemLoader()
            : SetupPage(
                profile: widget.profile,
                body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleSubtitle(
                          title:
                              AppLocalizations.of(context)!.setup_badges_title,
                          subTitle: AppLocalizations.of(context)!
                              .setup_badges_subtitle),
                      const SizedBox(
                        height: spacingFive,
                      ),
                      BadgeTypeSelector(
                          onTapped: handleBadgeTap,
                          currentBadges: newBadgeList.map((e) => e.id)),
                    ]),
                action:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  ContinueButton(
                    continueText: AppLocalizations.of(context)!.continue_button,
                    onPressed: updateBadges,
                    enabled: newBadgeList.isNotEmpty &&
                        newBadgeList.length <= badgeLimit,
                  ),
                ])));
  }
}
