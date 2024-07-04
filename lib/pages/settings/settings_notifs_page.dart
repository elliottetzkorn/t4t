import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/header_with_back_button.dart';
import 'package:t4t/components/switch_cell.dart';
import 'package:t4t/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/providers/profile_provider.dart';

class SettingsNotifsPage extends ConsumerWidget {
  const SettingsNotifsPage(
      {super.key, this.embedded = false, this.navigationCellTapped});

  final bool embedded;
  final Function? navigationCellTapped;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider).value!;

    return Scaffold(
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
          HeaderWithBackButton(
              title: AppLocalizations.of(context)!.settings_notifs_title),
          const SizedBox(
            height: spacingFour,
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: spacingFive),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SwitchCell(
                            title: AppLocalizations.of(context)!
                                .settings_notifications_messages_title,
                            subTitle: AppLocalizations.of(context)!
                                .settings_notifications_messages_subtitle,
                            switchValue: profile.messageNotif,
                            onPressed: () {
                              ref
                                  .read(profileProvider.notifier)
                                  .updateMessageNotif(!profile.messageNotif);
                            },
                          ),
                          const SizedBox(height: spacingFive),
                          SwitchCell(
                            title: AppLocalizations.of(context)!
                                .settings_notifications_likes_title,
                            subTitle: AppLocalizations.of(context)!
                                .settings_notifications_likes_subtitle,
                            switchValue: profile.likeNotif,
                            onPressed: () {
                              ref
                                  .read(profileProvider.notifier)
                                  .updateLikeNotif(!profile.likeNotif);
                            },
                          ),
                        ],
                      ))))
        ])));
  }
}
