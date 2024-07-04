import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/constants.dart';

part 'simple_font_provider.g.dart';

@riverpod
class SimpleFont extends _$SimpleFont {
  @override
  bool build() {
    return prefs.getBool(prefsSettingsSimpleFont) == true;
  }

  void toggle() {
    prefs.setBool(prefsSettingsSimpleFont, !state);
    state = !state;
  }
}
