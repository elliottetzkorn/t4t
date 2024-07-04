import 'package:geolocator/geolocator.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_data.freezed.dart';

@freezed
class LocationData with _$LocationData {
  const factory LocationData(
      {required Position position,
      String? neighborhoodName,
      String? cityName,
      String? stateName,
      String? countryName}) = _LocationData;
}
