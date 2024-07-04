import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:t4t/enums/dark_theme_enum.dart';
import 'package:t4t/enums/light_theme_enum.dart';

part 'theme_data.freezed.dart';

@freezed
class SystemThemeData with _$SystemThemeData {
  const factory SystemThemeData(
      {required DarkColorThemeEnum darkTheme,
      required LightColorThemeEnum lightTheme,
      required ThemeMode mode}) = _SystemThemeData;
}
