import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/continue_button.dart';
import 'package:t4t/components/title_subtitle.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/design_system/system_loader.dart';
import 'package:t4t/design_system/system_text_button.dart';
import 'package:t4t/extensions/router_extensions.dart';
import 'package:t4t/pages/setup/setup_page.dart';
import 'package:t4t/providers/router_provider.dart';
import 'package:t4t/utils/supporter_utils.dart';

class SetupSupporterPage extends ConsumerStatefulWidget {
  const SetupSupporterPage({super.key, required this.profile});

  final ProfileData profile;

  @override
  ConsumerState<SetupSupporterPage> createState() =>
      _SetupSupporterPagePageState();
}

class _SetupSupporterPagePageState extends ConsumerState<SetupSupporterPage> {
  bool _saving = false;

  Future<void> _launchSupporterFlow() async {
    setState(() => _saving = true);

    await SupporterUtils.attemptPurchase(context, ref, true).then((value) {
      ref.read(routerProvider).toProfileSetup(widget.profile.copyWith(), ref);
    }).catchError((error) {
      setState(() => _saving = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _saving
            ? const SystemLoader()
            : SetupPage(
                profile: widget.profile,
                closable: true,
                body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleSubtitle(
                          title: AppLocalizations.of(context)!.supporter,
                          subTitle: AppLocalizations.of(context)!
                              .supporter_explanation),
                    ]),
                action: Column(children: [
                  ContinueButton(
                    continueText: AppLocalizations.of(context)!.supporter_cta,
                    onPressed: _launchSupporterFlow,
                    enabled: true,
                  ),
                  const SizedBox(height: spacingFour),
                  SystemTextButton(
                    text: AppLocalizations.of(context)!.skip,
                    onPressed: () {
                      prefs.setBool(
                          prefsSetupSkipSupporter + widget.profile.id, true);
                      ref
                          .read(routerProvider)
                          .toProfileSetup(widget.profile, ref);
                    },
                  ),
                ])));
  }
}
