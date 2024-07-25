import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/components/continue_button.dart';
import 'package:t4t/components/limited_length_text_form_field.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/design_system/system_loader.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/extensions/router_extensions.dart';
import 'package:t4t/pages/setup/setup_page.dart';
import 'package:t4t/providers/profile_provider.dart';
import 'package:t4t/providers/router_provider.dart';
import 'package:t4t/utils/setup_utils.dart';

class SetupUserNamePage extends ConsumerStatefulWidget {
  const SetupUserNamePage({super.key, required this.profile});

  final ProfileData profile;

  @override
  ConsumerState<SetupUserNamePage> createState() => _SetupUserNamePageState();
}

class _SetupUserNamePageState extends ConsumerState<SetupUserNamePage> {
  var _saving = false;
  bool usernameAvailable = true;
  bool checkingUsername = false;
  String _userName = '';
  DateTime? lastKeyStroke;

  @override
  void initState() {
    super.initState();

    if (SetupUtils.oauthUsername != null) {
      setState(() {
        _userName = SetupUtils.oauthUsername!;
        checkIfUsernameAvailable(_userName);
      });
    }
  }

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
    if (mounted) {
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
  }

  Future<dynamic> _updateProfile() async {
    setState(() => _saving = true);

    await ref
        .read(profileProvider.notifier)
        .updateUsername(_userName)
        .then((_) {
      ref
          .read(routerProvider)
          .toProfileSetup(widget.profile.copyWith(username: _userName), ref);
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
                      LimitedLengthTextFormField(
                          text: _userName,
                          capitalization: TextCapitalization.none,
                          autoFocus: true,
                          onSubmitted: (p0) {
                            if (usernameAvailable &&
                                !checkingUsername &&
                                _userName.isNotEmpty) {
                              _updateProfile();
                            }
                          },
                          title: AppLocalizations.of(context)!
                              .setup_username_title,
                          hint: AppLocalizations.of(context)!
                              .setup_username_subtitle,
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
                                  padding:
                                      const EdgeInsets.only(top: spacingFive),
                                  child: SystemText(
                                      size: TextSizeEnum.twelve,
                                      text: checkingUsername
                                          ? AppLocalizations.of(context)!
                                              .setup_pronouns_checking
                                          : AppLocalizations.of(context)!
                                              .setup_pronouns_taken,
                                      color: checkingUsername
                                          ? Theme.of(context)
                                              .colorScheme
                                              .secondary
                                          : Theme.of(context)
                                              .colorScheme
                                              .error))))
                    ]),
                action: ContinueButton(
                  continueText: AppLocalizations.of(context)!.continue_button,
                  onPressed: _updateProfile,
                  enabled: usernameAvailable &&
                      !checkingUsername &&
                      _userName.isNotEmpty,
                )));
  }
}
