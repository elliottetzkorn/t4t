import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/continue_button.dart';
import 'package:t4t/components/limited_length_text_form_field.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/design_system/system_loader.dart';
import 'package:t4t/extensions/router_extensions.dart';
import 'package:t4t/pages/setup/setup_page.dart';
import 'package:t4t/providers/profile_provider.dart';
import 'package:t4t/providers/router_provider.dart';

class SetupRacePage extends ConsumerStatefulWidget {
  const SetupRacePage({super.key, required this.profile});

  final ProfileData profile;

  @override
  ConsumerState<SetupRacePage> createState() => _SetupRacePageState();
}

class _SetupRacePageState extends ConsumerState<SetupRacePage> {
  var _saving = false;
  var _requiresSaving = false;
  String? race;

  void handleCaptionChanged(
      String? text, bool captionUnique, bool captionShortEnough) {
    race = text;

    setState(() {
      _requiresSaving = captionUnique && captionShortEnough;
    });
  }

  Future<dynamic> _updateProfile() async {
    if (_requiresSaving) {
      setState(() => _saving = true);

      await ref.read(profileProvider.notifier).updateRace(race).then((_) {
        ref
            .read(routerProvider)
            .toProfileSetup(widget.profile.copyWith(race: race), ref);
      });

      setState(() => _saving = false);
    } else {
      prefs.setBool(prefsSetupSkipRace + widget.profile.id, true);
      ref.read(routerProvider).toProfileSetup(widget.profile, ref);
    }
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
                      LimitedLengthTextFormField(
                          capitalization: TextCapitalization.none,
                          autoFocus: true,
                          onSubmitted: (p0) {
                            if (_requiresSaving) {
                              _updateProfile();
                            }
                          },
                          title: AppLocalizations.of(context)!.setup_race_title,
                          hint:
                              AppLocalizations.of(context)!.setup_race_subtitle,
                          maxChars: titleLength,
                          handleCaptionChanged: handleCaptionChanged)
                    ]),
                action: ContinueButton(
                  continueText: AppLocalizations.of(context)!.continue_button,
                  onPressed: _updateProfile,
                  enabled: true,
                )));
  }
}
