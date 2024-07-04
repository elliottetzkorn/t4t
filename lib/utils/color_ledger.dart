import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:t4t/extensions/color_extensions.dart';

class ColorLedger {
  ColorLedger._();

  static Map<Color, Color> lightModeColors = HashMap();
  static Map<Color, Color> darkModeColors = HashMap();

  static Color getColor(Color inputColor, Brightness brightness) {
    if (brightness == Brightness.light) {
      if (!lightModeColors.containsKey(inputColor)) {
        lightModeColors[inputColor] = inputColor.brightenOrDarkenIfNeeded(true);
      }

      return lightModeColors[inputColor]!;
    } else {
      if (!darkModeColors.containsKey(inputColor)) {
        darkModeColors[inputColor] = inputColor.brightenOrDarkenIfNeeded(false);
      }

      return darkModeColors[inputColor]!;
    }
  }
}
