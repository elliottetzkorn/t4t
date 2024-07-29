import 'package:t4t/enums/font_scale_enum.dart';
import 'package:t4t/enums/text_size_enum.dart';

class FontUtils {
  FontUtils._();

  static TextSizeEnum deriveScaledTextSize(FontScaleEnum fontScale, List<TextSizeEnum> textSizes) {
    switch (fontScale) {
      case FontScaleEnum.small:
        return textSizes[0];
      case FontScaleEnum.normal:
        return textSizes[1];
      case FontScaleEnum.large:
        return textSizes[2];
    }
  }
}
