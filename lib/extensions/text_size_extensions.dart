import 'package:t4t/enums/text_size_enum.dart';

extension DoubleParsing on TextSizeEnum {
  double toFontSize() {
    switch (this) {
      case TextSizeEnum.twelve:
        return 12;
      case TextSizeEnum.fifteen:
        return 15;
      case TextSizeEnum.eighteen:
        return 18;
      case TextSizeEnum.twentyOne:
        return 21;
      case TextSizeEnum.twentyNine:
        return 29;
    }
  }
}
