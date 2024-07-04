import 'package:flutter/material.dart';

extension BooleanExtension on ThemeMode {
  bool includesLight() {
    switch (this) {
      case ThemeMode.dark:
        return false;
      default:
        return true;
    }
  }

  bool includesDark() {
    switch (this) {
      case ThemeMode.light:
        return false;
      default:
        return true;
    }
  }
}
