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

class SettingsBioPage extends ConsumerStatefulWidget {
  const SettingsBioPage({super.key, required this.profile});

  final ProfileData profile;

  @override
  ConsumerState<SettingsBioPage> createState() => _SettingsBioPageState();
}

class _SettingsBioPageState extends ConsumerState<SettingsBioPage> {
  var _saving = false;
  var _requiresSaving = false;
  String? _bio;

  void handleCaptionChanged(
      String? text, bool captionUnique, bool captionShortEnough) {
    _bio = text;

    setState(() {
      _requiresSaving = (captionUnique && captionShortEnough) ||
          ((_bio == null || _bio!.isEmpty) && captionUnique);
    });
  }

  bool requiresSaving(ProfileData profile, String? text, bool captionUnique,
      bool captionShortEnough) {
    return (captionUnique && captionShortEnough && _bio != profile.bio) ||
        ((_bio == null || _bio!.isEmpty) &&
            captionUnique &&
            _bio != profile.bio);
  }

  Future<dynamic> _updateProfile() async {
    setState(() => _saving = true);

    await ref.read(profileProvider.notifier).updateBio(_bio).then((_) {
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
                  lines: 6,
                  highContrast: true,
                  autoFocus: true,
                  onSubmitted: (p0) {
                    if (_requiresSaving && _bio != widget.profile.bio) {
                      _updateProfile();
                    }
                  },
                  text: widget.profile.bio,
                  title: AppLocalizations.of(context)!.settings_bio_title,
                  hint: AppLocalizations.of(context)!.settings_bio_subtitle,
                  maxChars: bioLength,
                  handleCaptionChanged: handleCaptionChanged),
            ]),
        action: SaveButton(
            saving: _saving,
            enabled: _requiresSaving && _bio != widget.profile.bio,
            onPressed: _updateProfile));
  }
}
