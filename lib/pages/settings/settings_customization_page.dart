import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/header_with_back_button.dart';
import 'package:t4t/components/switch_cell.dart';
import 'package:t4t/components/title_subtitle.dart';
import 'package:t4t/design_system/system_radio_button.dart';
import 'package:t4t/enums/dark_theme_enum.dart';
import 'package:t4t/enums/font_scale_enum.dart';
import 'package:t4t/enums/light_theme_enum.dart';
import 'package:t4t/enums/profile_page_pages_enum.dart';
import 'package:t4t/enums/theme_mode_extensions.dart';
import 'package:t4t/extensions/color_theme_enum_extensions.dart';
import 'package:t4t/extensions/profile_page_pages_enum_extensions.dart';
import 'package:t4t/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/providers/font_scale_provider.dart';
import 'package:t4t/providers/simple_font_provider.dart';
import 'package:t4t/providers/theme_provider.dart';

class SettingsCustomizationPage extends ConsumerWidget {
  const SettingsCustomizationPage(
      {super.key, this.embedded = false, this.navigationCellTapped});

  final bool embedded;
  final Function? navigationCellTapped;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeaderWithBackButton(
                    title: ProfilePagePagesEnum.customization.title(context)),
                const SizedBox(
                  height: spacingFour,
                ),
                Expanded(
                    child: SingleChildScrollView(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: spacingFive),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const SizedBox(height: spacingFive),
                                TitleSubtitle(
                                    title: AppLocalizations.of(context)!
                                        .settings_accessibility_mode_title,
                                    subTitle: AppLocalizations.of(context)!
                                        .settings_accessibility_mode_subtitle),
                                const SizedBox(height: spacingFive),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: spacingFour),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          for (ThemeMode mode
                                              in ThemeMode.values)
                                            SystemRadioButton(
                                              title: mode.name.capitalize,
                                              value: mode,
                                              groupValue: ref.watch(
                                                  themeProvider
                                                      .select((it) => it.mode)),
                                              onChanged: (p0) {
                                                ref
                                                    .read(
                                                        themeProvider.notifier)
                                                    .setMode(p0);
                                              },
                                            )
                                        ])),
                                const SizedBox(height: spacingFive),
                                if (ref
                                    .watch(
                                        themeProvider.select((it) => it.mode))
                                    .includesLight())
                                  Column(children: [
                                    TitleSubtitle(
                                        title: AppLocalizations.of(context)!
                                            .settings_accessibility_light_theme_title,
                                        subTitle: AppLocalizations.of(context)!
                                            .settings_accessibility_light_theme_subtitle),
                                    const SizedBox(height: spacingFive),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: spacingFour),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              for (LightColorThemeEnum theme
                                                  in LightColorThemeEnum.values)
                                                SystemRadioButton(
                                                  title: theme
                                                      .title(context)
                                                      .capitalize,
                                                  value: theme,
                                                  groupValue: ref.watch(
                                                      themeProvider.select(
                                                          (it) =>
                                                              it.lightTheme)),
                                                  onChanged: (p0) {
                                                    ref
                                                        .read(themeProvider
                                                            .notifier)
                                                        .setLightTheme(p0);
                                                  },
                                                )
                                            ])),
                                    const SizedBox(height: spacingFive),
                                  ]),
                                if (ref
                                    .watch(
                                        themeProvider.select((it) => it.mode))
                                    .includesDark())
                                  Column(children: [
                                    TitleSubtitle(
                                        title: AppLocalizations.of(context)!
                                            .settings_accessibility_dark_theme_title,
                                        subTitle: AppLocalizations.of(context)!
                                            .settings_accessibility_dark_theme_subtitle),
                                    const SizedBox(height: spacingFive),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: spacingFour),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              for (DarkColorThemeEnum theme
                                                  in DarkColorThemeEnum.values)
                                                SystemRadioButton(
                                                  title: theme
                                                      .title(context)
                                                      .capitalize,
                                                  value: theme,
                                                  groupValue: ref.watch(
                                                      themeProvider.select(
                                                          (it) =>
                                                              it.darkTheme)),
                                                  onChanged: (p0) {
                                                    ref
                                                        .read(themeProvider
                                                            .notifier)
                                                        .setDarkTheme(p0);
                                                  },
                                                )
                                            ]))
                                  ]),
                                SwitchCell(
                                  title: AppLocalizations.of(context)!
                                      .settings_accessibility_font_title,
                                  subTitle: AppLocalizations.of(context)!
                                      .settings_accessibility_font_subtitle,
                                  switchValue: ref.watch(simpleFontProvider),
                                  onPressed: () {
                                    ref
                                        .read(simpleFontProvider.notifier)
                                        .toggle();
                                  },
                                ),
                                const SizedBox(height: spacingFive),
                                Column(children: [
                                  TitleSubtitle(
                                      title: AppLocalizations.of(context)!
                                          .settings_accessibility_font_scale_title,
                                      subTitle: AppLocalizations.of(context)!
                                          .settings_accessibility_font_scale_subtitle),
                                  const SizedBox(height: spacingFive),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: spacingFour),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            for (FontScaleEnum fontScale
                                                in FontScaleEnum.values)
                                              SystemRadioButton(
                                                title:
                                                    fontScale.name.capitalize,
                                                value: fontScale,
                                                groupValue: ref
                                                    .watch(fontScaleProvider),
                                                onChanged: (p0) {
                                                  ref
                                                      .read(fontScaleProvider
                                                          .notifier)
                                                      .setFontScale(p0);
                                                },
                                              )
                                          ]))
                                ]),
                                const SizedBox(height: spacingEight),
                              ],
                            ))))
              ])),
    );
  }
}
