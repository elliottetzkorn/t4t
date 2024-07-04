import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/enums/color_theme_enum.dart';
import 'package:t4t/enums/dark_theme_enum.dart';
import 'package:t4t/enums/light_theme_enum.dart';
import 'package:t4t/utils/theme_utils.dart';

extension LightStringParsing on LightColorThemeEnum {
  String title(BuildContext context) {
    switch (this) {
      case LightColorThemeEnum.white:
        return AppLocalizations.of(context)!.white;
      case LightColorThemeEnum.brutalist:
        return AppLocalizations.of(context)!.brutalist;
      case LightColorThemeEnum.red:
        return AppLocalizations.of(context)!.red;
      case LightColorThemeEnum.blue:
        return AppLocalizations.of(context)!.blue;
    }
  }
}

extension DarkStringParsing on DarkColorThemeEnum {
  String title(BuildContext context) {
    switch (this) {
      case DarkColorThemeEnum.black:
        return AppLocalizations.of(context)!.black;

      case DarkColorThemeEnum.klein:
        return AppLocalizations.of(context)!.klein;
    }
  }
}

extension LightThemeDataParsing on LightColorThemeEnum {
  ThemeData data() {
    switch (this) {
      case LightColorThemeEnum.white:
        return ThemeUtils.themeForThemeEnum(
            Brightness.light, ColorThemeEnum.white);
      case LightColorThemeEnum.brutalist:
        return ThemeUtils.themeForThemeEnum(
            Brightness.light, ColorThemeEnum.brutalist);
      case LightColorThemeEnum.red:
        return ThemeUtils.themeForThemeEnum(
            Brightness.light, ColorThemeEnum.red);
      case LightColorThemeEnum.blue:
        return ThemeUtils.themeForThemeEnum(
            Brightness.light, ColorThemeEnum.blue);
    }
  }
}

extension DarkThemeDataParsing on DarkColorThemeEnum {
  ThemeData data() {
    switch (this) {
      case DarkColorThemeEnum.black:
        return ThemeUtils.themeForThemeEnum(
            Brightness.dark, ColorThemeEnum.black);

      case DarkColorThemeEnum.klein:
        return ThemeUtils.themeForThemeEnum(
            Brightness.dark, ColorThemeEnum.klein);
    }
  }
}
