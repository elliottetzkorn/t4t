import 'package:t4t/enums/font_scale_enum.dart';

extension DoubleParsing on FontScaleEnum {
  double toMultiple() {
    switch (this) {
      case FontScaleEnum.small:
        return 0.85;
      case FontScaleEnum.normal:
        return 1;
      case FontScaleEnum.large:
        return 1.15;
    }
  }
}
