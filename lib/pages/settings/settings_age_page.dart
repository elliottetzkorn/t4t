import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:t4t/components/save_button.dart';
import 'package:t4t/components/switch_cell.dart';
import 'package:t4t/components/title_subtitle.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/design_system/system_action_page.dart';
import 'package:t4t/extensions/date_time_extensions.dart';
import 'package:t4t/providers/profile_provider.dart';
import 'package:t4t/providers/simple_font_provider.dart';

class SettingsAgePage extends ConsumerStatefulWidget {
  const SettingsAgePage({super.key, required this.profile});

  final ProfileData profile;

  @override
  ConsumerState<SettingsAgePage> createState() => _SettingsAgePageState();
}

class _SettingsAgePageState extends ConsumerState<SettingsAgePage> {
  var _saving = false;
  DateTime? _birthDate;
  bool? _showAstro;

  Future<void> _updateProfile() async {
    setState(() => _saving = true);

    await ref
        .read(profileProvider.notifier)
        .updateBirthdate(
            _birthDate!, _showAstro!, _birthDate!.toAstrologicalSign())
        .then((_) {
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
                              color: Theme.of(context).colorScheme.primary,
                              fontFamily: ref.watch(simpleFontProvider)
                                  ? fontSimple
                                  : fontWaxWing,
                              fontSize: 18),
                        ),
                      ),
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: _birthDate ?? widget.profile.birthday,
                        maximumDate: DateTime.now()
                            .subtract(const Duration(days: appMinAge * 365)),
                        minimumDate: DateTime.now()
                            .subtract(const Duration(days: 120 * 365)),
                        onDateTimeChanged: (DateTime newDateTime) {
                          setState(() {
                            _birthDate = newDateTime;
                          });
                          // Do something
                        },
                      ))),
              SwitchCell(
                title: AppLocalizations.of(context)!.settings_show_astrology,
                subTitle: AppLocalizations.of(context)!
                    .settings_show_astrology_subtitle,
                switchValue:
                    _showAstro != null ? _showAstro! : widget.profile.showAstro,
                onPressed: () {
                  setState(() {
                    if (_showAstro == null) {
                      _showAstro = !widget.profile.showAstro;
                    } else {
                      _showAstro = !_showAstro!;
                    }
                  });
                },
              ),
            ]),
        action: SaveButton(
          saving: _saving,
          onPressed: _updateProfile,
          enabled: _birthDate != widget.profile.birthday ||
              _showAstro != widget.profile.showAstro,
        ));
  }
}
