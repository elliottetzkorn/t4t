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

class SettingsPronounsPage extends ConsumerStatefulWidget {
  const SettingsPronounsPage({super.key, required this.profile});

  final ProfileData profile;

  @override
  ConsumerState<SettingsPronounsPage> createState() =>
      _SetupPronounsPageState();
}

class _SetupPronounsPageState extends ConsumerState<SettingsPronounsPage> {
  var _saving = false;
  var _requiresSaving = false;
  late String pronouns;

  void handleCaptionChanged(
      String? text, bool captionUnique, bool captionShortEnough) {
    if (text != null) {
      pronouns = text;
    }

    setState(() {
      _requiresSaving =
          captionUnique && captionShortEnough && pronouns.isNotEmpty;
    });
  }

  Future<dynamic> _updateProfile() async {
    setState(() => _saving = true);

    await ref.read(profileProvider.notifier).updatePronouns(pronouns).then((_) {
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
                    if (_requiresSaving &&
                        pronouns != widget.profile.pronouns) {
                      _updateProfile();
                    }
                  },
                  text: widget.profile.pronouns?.toLowerCase(),
                  title: AppLocalizations.of(context)!.setup_pronouns_title,
                  hint: AppLocalizations.of(context)!.setup_pronouns_subtitle,
                  maxChars: titleLength,
                  handleCaptionChanged: handleCaptionChanged),
            ]),
        action: SaveButton(
            saving: _saving,
            enabled: _requiresSaving && pronouns != widget.profile.pronouns,
            onPressed: _updateProfile));
  }
}
