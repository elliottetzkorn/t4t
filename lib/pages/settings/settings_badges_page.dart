import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:t4t/components/badge_type_selector.dart';
import 'package:t4t/components/save_button.dart';
import 'package:t4t/components/title_subtitle.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/badge_data.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/design_system/system_action_page.dart';
import 'package:t4t/providers/profile_provider.dart';

class SettingsBadgesPage extends ConsumerStatefulWidget {
  const SettingsBadgesPage({super.key, required this.profile});

  final ProfileData profile;

  @override
  ConsumerState<SettingsBadgesPage> createState() => _SettingsBadgesPageState();
}

class _SettingsBadgesPageState extends ConsumerState<SettingsBadgesPage> {
  bool loadingBadges = true;
  bool loadingBadgesFailed = false;
  bool insertingBadges = false;
  bool insertingBadgesFailed = false;
  bool requiresSaving = false;
  List<BadgeData> newBadgeList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();

    newBadgeList.addAll(widget.profile.badges!);
  }

  Future<void> updateBadges() async {
    setState(() => insertingBadges = true);

    await ref
        .read(profileProvider.notifier)
        .updateBadges(newBadgeList)
        .then((_) {
      context.pop();
    });

    setState(() => insertingBadges = false);
  }

  void handleBadgeTap(BadgeData badgeTapped) {
    setState(() {
      if (newBadgeList.any((element) => element.id == badgeTapped.id)) {
        newBadgeList.removeWhere((element) => element.id == badgeTapped.id);
      } else {
        newBadgeList.add(badgeTapped);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SystemActionPage(
        body: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleSubtitle(
                  title: AppLocalizations.of(context)!.setup_badges_title,
                  subTitle:
                      AppLocalizations.of(context)!.setup_badges_subtitle),
              const SizedBox(
                height: spacingFive,
              ),
              BadgeTypeSelector(
                  onTapped: handleBadgeTap,
                  currentBadges: newBadgeList.map((e) => e.id)),
            ]),
        action: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SaveButton(
                saving: insertingBadges,
                enabled: newBadgeList.isNotEmpty &&
                    newBadgeList.length <= badgeLimit &&
                    newBadgeList.length != widget.profile.badges?.length,
                onPressed: updateBadges),
          ],
        ));
  }
}
