import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:t4t/extensions/color_extensions.dart';
import 'package:t4t/extensions/strings_extensions.dart';

class ColorConverter implements JsonConverter<Color, String> {
  const ColorConverter();

  @override
  Color fromJson(String value) {
    return value.toColor();
  }

  @override
  String toJson(Color value) => value.toHex();
}
