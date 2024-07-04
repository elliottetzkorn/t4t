import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/components/limited_length_text_form_field.dart';
import 'package:t4t/components/save_button.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/design_system/system_action_page.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/providers/profile_provider.dart';

class SettingsUserNamePage extends ConsumerStatefulWidget {
  const SettingsUserNamePage({super.key, required this.profile});

  final ProfileData profile;

  @override
  ConsumerState<SettingsUserNamePage> createState() =>
      _SettingsUserNamePageState();
}

class _SettingsUserNamePageState extends ConsumerState<SettingsUserNamePage> {
  var _saving = false;
  bool usernameAvailable = true;
  bool checkingUsername = false;
  String _userName = '';
  DateTime? lastKeyStroke;

  void handleCaptionChanged(
      String? text, bool captionUnique, bool captionShortEnough) {
    if (text != null && captionUnique && captionShortEnough) {
      _userName = text.trim().replaceAll(' ', '');

      if (_userName.isNotEmpty) {
        setState(() {
          checkingUsername = true;
          usernameAvailable = true;
        });

        lastKeyStroke = DateTime.now();

        Timer(const Duration(milliseconds: 500), () {
          if (lastKeyStroke == null ||
              DateTime.now().difference(lastKeyStroke!).inMilliseconds >= 500) {
            checkIfUsernameAvailable(_userName);
          }
        });
      }
    } else {
      setState(() {
        _userName = '';
      });
    }
  }

  Future<void> checkIfUsernameAvailable(String usernameToCheck) async {
    await Supabase.instance.client
        .from('profiles')
        .select('id')
        .ilike('username', usernameToCheck)
        .then((value) {
      if (value.isNotEmpty) {
        setState(() {
          usernameAvailable = false;
        });
      }
    });

    setState(() {
      checkingUsername = false;
    });
  }

  Future<dynamic> _updateProfile() async {
    setState(() => _saving = true);

    await ref
        .read(profileProvider.notifier)
        .updateUsername(_userName)
        .then((_) {
      context.pop();
    });

    setState(() => _saving = false);
  }

  @override
  Widget build(BuildContext context) {
    return SystemActionPage(
        body: Column(mainAxisSize: MainAxisSize.min, children: [
          LimitedLengthTextFormField(
              capitalization: TextCapitalization.none,
              autoFocus: true,
              text: widget.profile.username,
              highContrast: true,
              onSubmitted: (p0) {
                if (usernameAvailable &&
                    !checkingUsername &&
                    _userName.isNotEmpty) {
                  _updateProfile();
                }
              },
              title: AppLocalizations.of(context)!.setup_username_title,
              hint: AppLocalizations.of(context)!.setup_username_subtitle,
              maxChars: usernameLength,
              handleCaptionChanged: handleCaptionChanged),
          Visibility(
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
              visible: !usernameAvailable || checkingUsername,
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                      padding: const EdgeInsets.only(top: spacingFive),
                      child: SystemText(
                          size: TextSizeEnum.twelve,
                          text: checkingUsername
                              ? AppLocalizations.of(context)!
                                  .setup_pronouns_checking
                              : AppLocalizations.of(context)!
                                  .setup_pronouns_taken,
                          color: checkingUsername
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).colorScheme.error)))),
        ]),
        action: SaveButton(
            saving: _saving,
            enabled:
                usernameAvailable && !checkingUsername && _userName.isNotEmpty,
            onPressed: _updateProfile));
  }
}
