import 'package:flutter/material.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/utils/color_ledger.dart';

extension StringParsing on Color {
  String toHex() => '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension ColorParsing on Color {
  static const double brightnessDeltaGentle = 0.02;

  Color adjusted(Brightness brightness) {
    return ColorLedger.getColor(this, brightness);
  }

  Color brightenOrDarkenIfNeeded(bool brightMode) {
    double luminence = computeLuminance();

    if (luminence > luminenceUpperBound && brightMode) {
      return darkenColorUntilDarkEnough();
    } else if (luminence <= luminenceLowerBound && !brightMode) {
      return lightColorUntilLightEnough();
    } else {
      return this;
    }
  }

  Color darken() {
    return Color.lerp(this, Colors.black, brightnessDeltaGentle)!;
  }

  Color lighten() {
    return Color.lerp(this, Colors.white, brightnessDeltaGentle)!;
  }

  Color lightColorUntilLightEnough() {
    Color lightenedColor = this;

    while (lightenedColor.computeLuminance() < luminenceLowerBound) {
      lightenedColor = lightenedColor.lighten();
    }

    return lightenedColor;
  }

  Color darkenColorUntilDarkEnough() {
    Color darkenedColor = this;

    while (darkenedColor.computeLuminance() > luminenceUpperBound) {
      darkenedColor = darkenedColor.darken();
    }

    return darkenedColor;
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
