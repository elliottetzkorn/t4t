import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/providers/theme_provider.dart';

part 'resolved_brightness_provider.g.dart';

@riverpod
class ResolvedBrightness extends _$ResolvedBrightness {
  @override
  Brightness build() {
    final mode = ref.watch(themeProvider.select((value) => value.mode));

    switch (mode) {
      case ThemeMode.dark:
        return Brightness.dark;
      case ThemeMode.light:
        return Brightness.light;
      case ThemeMode.system:
        return PlatformDispatcher.instance.platformBrightness;
    }
  }

  void platformBrightnessChanged(Brightness brightness) {
    final mode = ref.read(themeProvider.select((value) => value.mode));

    switch (mode) {
      case ThemeMode.dark:
      case ThemeMode.light:
        break;
      case ThemeMode.system:
        if (state != brightness) state = brightness;
        break;
    }
  }
}
