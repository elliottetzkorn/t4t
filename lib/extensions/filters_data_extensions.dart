import 'package:t4t/constants.dart';
import 'package:t4t/data/filters_data.dart';

extension BooleanParsing on FiltersData {
  bool isDefault() {
    if (type != postTypes.first) {
      return false;
    }

    if (distance != maxDistanceKey) {
      return false;
    }

    if (badges.isNotEmpty) {
      return false;
    }

    if (minAge != appMinAge) {
      return false;
    }

    if (maxAge != appMaxAge) {
      return false;
    }

    if (words.isNotEmpty) {
      return false;
    }

    return true;
  }
}
