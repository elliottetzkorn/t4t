import 'package:t4t/enums/astrological_sign_enum.dart';

extension AstrologicalSignEnumParsing on DateTime {
  AstrologicalSignEnum toAstrologicalSign() {
    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
      return AstrologicalSignEnum.aries;
    } else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
      return AstrologicalSignEnum.taurus;
    } else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
      return AstrologicalSignEnum.gemini;
    } else if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
      return AstrologicalSignEnum.cancer;
    } else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
      return AstrologicalSignEnum.leo;
    } else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
      return AstrologicalSignEnum.virgo;
    } else if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) {
      return AstrologicalSignEnum.libra;
    } else if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) {
      return AstrologicalSignEnum.scorpio;
    } else if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
      return AstrologicalSignEnum.sagittarius;
    } else if ((month == 12 && day >= 22) || (month == 1 && day <= 19)) {
      return AstrologicalSignEnum.capricorn;
    } else if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
      return AstrologicalSignEnum.aquarius;
    } else if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
      return AstrologicalSignEnum.pisces;
    } else {
      throw Exception('Invalid date for astrological sign calculation');
    }
  }
}
