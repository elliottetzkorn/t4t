import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/theme_data.dart';
import 'package:t4t/enums/dark_theme_enum.dart';
import 'package:t4t/enums/light_theme_enum.dart';

part 'theme_provider.g.dart';

@riverpod
class Theme extends _$Theme {
  @override
  SystemThemeData build() {
    return SystemThemeData(
        lightTheme: prefs.getString(prefsSettingsLightTheme) == null
            ? LightColorThemeEnum.white
            : LightColorThemeEnum.values.firstWhere((e) =>
                e.toString() == prefs.getString(prefsSettingsLightTheme)!),
        darkTheme: prefs.getString(prefsSettingsDarkTheme) == null
            ? DarkColorThemeEnum.black
            : DarkColorThemeEnum.values.firstWhere((e) =>
                e.toString() == prefs.getString(prefsSettingsDarkTheme)!),
        mode: ThemeMode.values[prefs.getInt(prefsSettingsMode) ?? 0]);
  }

  void setLightTheme(LightColorThemeEnum lightTheme) {
    prefs.setString(prefsSettingsLightTheme, lightTheme.toString());
    state = state.copyWith(lightTheme: lightTheme);
  }

  void setDarkTheme(DarkColorThemeEnum darkTheme) {
    prefs.setString(prefsSettingsDarkTheme, darkTheme.toString());
    state = state.copyWith(darkTheme: darkTheme);
  }

  void setMode(ThemeMode mode) {
    prefs.setInt(prefsSettingsMode, mode.index);
    state = state.copyWith(mode: mode);
  }
}
