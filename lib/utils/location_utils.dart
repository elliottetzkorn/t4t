import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/location_data.dart';
import 'package:t4t/design_system/system_text.dart';

class LocationUtils {
  static Future<LocationData?> getLocation(BuildContext context) async {
    await Geolocator.isLocationServiceEnabled().then((value) {
      if (!value) {
        showError(context, AppLocalizations.of(context)!.setup_location_alert);
        return null;
      }
    });

    LocationPermission checkValue =
        await Geolocator.checkPermission().then((value) {
      if (value == LocationPermission.deniedForever) {
        showError(context, AppLocalizations.of(context)!.setup_location_alert);
      }

      return value;
    });

    if (checkValue == LocationPermission.deniedForever) {
      return null;
    } else if (checkValue == LocationPermission.denied) {
      await Geolocator.requestPermission().then((requestValue) {
        if (requestValue == LocationPermission.denied) {
          showError(
              context, AppLocalizations.of(context)!.setup_location_alert);
          return null;
        }
      });
    }

    setLocaleIdentifier('en_US');

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    position = Position(
      latitude: double.parse(position.latitude.toStringAsFixed(2)),
      longitude: double.parse(position.longitude.toStringAsFixed(2)),
      timestamp: position.timestamp,
      accuracy: position.accuracy,
      altitude: position.altitude,
      heading: position.heading,
      speed: position.speed,
      speedAccuracy: position.speedAccuracy,
      altitudeAccuracy: position.altitudeAccuracy,
      headingAccuracy: position.headingAccuracy,
    );

    return LocationData(
        position: position,
        neighborhoodName: placemarks.first.subLocality,
        cityName: placemarks.first.locality,
        stateName: placemarks.first.administrativeArea,
        countryName: placemarks.first.country);
  }

  static void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: SystemText(text: message, color: Colors.white),
      backgroundColor: Theme.of(context).colorScheme.error,
    ));
  }

  static String formatted(
      String? neighborhood, String city, String? state, String country) {
    if (globalCities.contains(city) &&
        neighborhood != null &&
        neighborhood.isNotEmpty) {
      return '${neighborhood.toLowerCase()}, ${city.toLowerCase()}';
    } else if (country == usa && state != null) {
      if (city.isNotEmpty) {
        return '${city.toLowerCase()}, ${LocationUtils.stateToShortenedState(state)}';
      } else {
        return '${LocationUtils.stateToShortenedState(state)}, ${country.toLowerCase()}';
      }
    } else {
      return '${city.toLowerCase()}, ${country.toLowerCase()}';
    }
  }

  static String stateToShortenedState(String state) {
    switch (state.toLowerCase()) {
      case 'alabama':
        return 'al';
      case 'alaska':
        return 'ak';
      case 'arizona':
        return 'az';
      case 'arkansas':
        return 'ar';
      case 'california':
        return 'ca';
      case 'colorado':
        return 'co';
      case 'connecticut':
        return 'ct';
      case 'delaware':
        return 'de';
      case 'district of columbia':
        return 'dc';
      case 'florida':
        return 'fl';
      case 'georgia':
        return 'ga';
      case 'hawaii':
        return 'hi';
      case 'idaho':
        return 'id';
      case 'illinois':
        return 'il';
      case 'indiana':
        return 'in';
      case 'iowa':
        return 'ia';
      case 'kansas':
        return 'ks';
      case 'kentucky':
        return 'ky';
      case 'louisiana':
        return 'la';
      case 'maine':
        return 'me';
      case 'maryland':
        return 'md';
      case 'massachusetts':
        return 'ma';
      case 'michigan':
        return 'mi';
      case 'minnesota':
        return 'mn';
      case 'mississippi':
        return 'ms';
      case 'missouri':
        return 'mo';
      case 'montana':
        return 'mt';
      case 'nebraska':
        return 'ne';
      case 'nevada':
        return 'nv';
      case 'new hampshire':
        return 'nh';
      case 'new jersey':
        return 'nj';
      case 'new mexico':
        return 'nm';
      case 'new york':
        return 'ny';
      case 'north carolina':
        return 'nc';
      case 'north dakota':
        return 'nd';
      case 'ohio':
        return 'oh';
      case 'oklahoma':
        return 'ok';
      case 'oregon':
        return 'or';
      case 'pennsylvania':
        return 'pa';
      case 'puerto rico':
        return 'pr';
      case 'rhode island':
        return 'ri';
      case 'south carolina':
        return 'sc';
      case 'south dakota':
        return 'sd';
      case 'tennessee':
        return 'tn';
      case 'texas':
        return 'tx';
      case 'utah':
        return 'ut';
      case 'vermont':
        return 'vt';
      case 'virginia':
        return 'va';
      case 'washington':
        return 'wa';
      case 'west virginia':
        return 'wv';
      case 'wisconsin':
        return 'wi';
      case 'wyoming':
        return 'wy';
      default:
        return state.toLowerCase();
    }
  }
}
