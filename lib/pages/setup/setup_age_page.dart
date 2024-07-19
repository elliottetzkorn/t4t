import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/continue_button.dart';
import 'package:t4t/components/title_subtitle.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/design_system/system_loader.dart';
import 'package:t4t/extensions/router_extensions.dart';
import 'package:t4t/pages/setup/setup_page.dart';
import 'package:t4t/providers/profile_provider.dart';
import 'package:t4t/providers/router_provider.dart';
import 'package:t4t/providers/simple_font_provider.dart';

class SetupAgePage extends ConsumerStatefulWidget {
  const SetupAgePage({super.key, required this.profile});

  final ProfileData profile;

  @override
  ConsumerState<SetupAgePage> createState() => _SetupAgePageState();
}

class _SetupAgePageState extends ConsumerState<SetupAgePage> {
  var _saving = false;
  DateTime birthDate =
      DateTime.now().subtract(const Duration(days: (appMinAge + 1) * 365));

  Future<void> _updateProfile() async {
    setState(() => _saving = true);

    await ref
        .read(profileProvider.notifier)
        .updateBirthdate(birthDate, true)
        .then((_) {
      ref.read(routerProvider).toProfileSetup(
          widget.profile.copyWith(showAstro: true, birthday: birthDate), ref);
    });

    setState(() => _saving = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _saving
            ? const SystemLoader()
            : SetupPage(
                profile: widget.profile,
                body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleSubtitle(
                          title: AppLocalizations.of(context)!.setup_age_title,
                          subTitle: AppLocalizations.of(context)!
                              .setup_age_subtitle(appMinAge)),
                      SizedBox(
                          height: 300,
                          child: CupertinoTheme(
                              data: CupertinoThemeData(
                                textTheme: CupertinoTextThemeData(
                                  dateTimePickerTextStyle: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontFamily: ref.watch(simpleFontProvider)
                                          ? fontSimple
                                          : fontWaxWing,
                                      fontSize: 18),
                                ),
                              ),
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                initialDateTime: birthDate,
                                maximumDate: DateTime.now().subtract(
                                    const Duration(days: appMinAge * 365)),
                                minimumDate: DateTime.now()
                                    .subtract(const Duration(days: 120 * 365)),
                                onDateTimeChanged: (DateTime newDateTime) {
                                  setState(() {
                                    birthDate = newDateTime;
                                  });
                                  // Do something
                                },
                              )))
                    ]),
                action: ContinueButton(
                  continueText: AppLocalizations.of(context)!.continue_button,
                  onPressed: _updateProfile,
                  enabled: true,
                )));
  }
}
