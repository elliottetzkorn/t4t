import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/header_with_back_button.dart';
import 'package:t4t/components/navigation_cell.dart';
import 'package:t4t/components/switch_cell.dart';
import 'package:t4t/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/providers/profile_provider.dart';
import 'package:t4t/providers/subscribing_provider.dart';
import 'package:t4t/utils/supporter_utils.dart';

class SettingsSupporterPage extends ConsumerWidget {
  const SettingsSupporterPage(
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
                title:
                    '✨${AppLocalizations.of(context)!.settings_supporter_title}'),
            const SizedBox(
              height: spacingFour,
            ),
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (!profile.supporter)
                  NavigationCell(
                      title: ref.watch(subscribingProvider)
                          ? AppLocalizations.of(context)!.subscribing
                          : AppLocalizations.of(context)!.subscribe,
                      subTitle: AppLocalizations.of(context)!
                          .subscribe_subscription_subtitle,
                      icon: PhosphorIcons.sparkle_thin,
                      onPressed: () => {
                            if (!ref.read(subscribingProvider))
                              {SupporterUtils.attemptPurchase(context, ref)}
                          }),
                if (!profile.supporter)
                  NavigationCell(
                      title: ref.watch(subscribingProvider)
                          ? AppLocalizations.of(context)!.restoring_subscription
                          : AppLocalizations.of(context)!.restore_subscription,
                      subTitle: AppLocalizations.of(context)!
                          .restore_subscription_subtitle,
                      icon: PhosphorIcons.waves_thin,
                      onPressed: () => {
                            if (!ref.read(subscribingProvider))
                              {SupporterUtils.restorePurchase(context, ref)}
                          }),
                if (profile.supporter)
                  NavigationCell(
                      embedded: true,
                      title: AppLocalizations.of(context)!
                          .settings_supporter_manage_title,
                      subTitle: AppLocalizations.of(context)!
                          .settings_supporter_manage_subtitle,
                      icon: PhosphorIcons.arrow_up_right_thin,
                      onPressed: () => SupporterUtils.goToSubscriptions()),
                if (profile.supporter)
                  Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: spacingFive),
                      child: SwitchCell(
                        title: AppLocalizations.of(context)!
                            .settings_supporter_show_title,
                        subTitle: AppLocalizations.of(context)!
                            .settings_supporter_show_subtitle,
                        switchValue: profile.showSupporter,
                        onPressed: () {
                          ref
                              .read(profileProvider.notifier)
                              .updateShowSupport(!profile.showSupporter);
                        },
                      ))
              ],
            )))
          ])),
    );
  }
}
