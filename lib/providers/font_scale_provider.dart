import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/enums/font_scale_enum.dart';

part 'font_scale_provider.g.dart';

@riverpod
class FontScale extends _$FontScale {
  @override
  FontScaleEnum build() {
    return prefs.getString(prefsSettingsFontScale) == null
        ? FontScaleEnum.normal
        : FontScaleEnum.values.firstWhere(
            (e) => e.toString() == prefs.getString(prefsSettingsFontScale)!);
  }

  void setFontScale(FontScaleEnum fontScale) {
    prefs.setString(prefsSettingsFontScale, fontScale.toString());
    state = fontScale;
  }
}
