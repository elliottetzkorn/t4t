import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:t4t/components/limited_length_text_form_field.dart';
import 'package:t4t/components/save_button.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/design_system/system_action_page.dart';
import 'package:t4t/providers/profile_provider.dart';

class SettingsRacePage extends ConsumerStatefulWidget {
  const SettingsRacePage({super.key, required this.profile});

  final ProfileData profile;

  @override
  ConsumerState<SettingsRacePage> createState() => _SettingsRacePageState();
}

class _SettingsRacePageState extends ConsumerState<SettingsRacePage> {
  var _saving = false;
  var _requiresSaving = false;
  String? race;

  void handleCaptionChanged(
      String? text, bool captionUnique, bool captionShortEnough) {
    race = text;

    setState(() {
      _requiresSaving = (captionUnique && captionShortEnough) ||
          race == null ||
          race!.isEmpty;
    });
  }

  Future<dynamic> _updateProfile() async {
    setState(() => _saving = true);

    await ref.read(profileProvider.notifier).updateRace(race).then((_) {
      context.pop();
    });

    setState(() => _saving = false);
  }

  @override
  Widget build(BuildContext context) {
    return SystemActionPage(
        body: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LimitedLengthTextFormField(
                  highContrast: true,
                  capitalization: TextCapitalization.none,
                  autoFocus: true,
                  onSubmitted: (p0) {
                    if (_requiresSaving) {
                      _updateProfile();
                    }
                  },
                  text: widget.profile.race != null
                      ? widget.profile.race!.toLowerCase()
                      : '',
                  title: AppLocalizations.of(context)!.setup_race_title,
                  hint: AppLocalizations.of(context)!.setup_race_subtitle,
                  maxChars: titleLength,
                  handleCaptionChanged: handleCaptionChanged),
            ]),
        action: SaveButton(
            saving: _saving,
            enabled: _requiresSaving,
            onPressed: _updateProfile));
  }
}
