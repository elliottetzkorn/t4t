import 'package:geocoding/geocoding.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/utils/location_utils.dart';

extension StringParsing on Placemark {
  String? shortenedLocality() {
    if (country == usa &&
        administrativeArea != null &&
        administrativeArea!.length > 2) {
      return LocationUtils.stateToShortenedState(administrativeArea!);
    } else {
      return administrativeArea;
    }
  }
}
