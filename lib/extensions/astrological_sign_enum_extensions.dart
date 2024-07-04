import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/enums/astrological_sign_enum.dart';

extension IntegerParsing on AstrologicalSignEnum {}

extension StringParsing on AstrologicalSignEnum {
  String toLocalizedString(BuildContext context) {
    switch (this) {
      case AstrologicalSignEnum.aries:
        return AppLocalizations.of(context)!.zodiac_ar;
      case AstrologicalSignEnum.taurus:
        return AppLocalizations.of(context)!.zodiac_ta;
      case AstrologicalSignEnum.gemini:
        return AppLocalizations.of(context)!.zodiac_ge;
      case AstrologicalSignEnum.cancer:
        return AppLocalizations.of(context)!.zodiac_ca;
      case AstrologicalSignEnum.leo:
        return AppLocalizations.of(context)!.zodiac_le;
      case AstrologicalSignEnum.virgo:
        return AppLocalizations.of(context)!.zodiac_vi;
      case AstrologicalSignEnum.libra:
        return AppLocalizations.of(context)!.zodiac_li;
      case AstrologicalSignEnum.scorpio:
        return AppLocalizations.of(context)!.zodiac_sc;
      case AstrologicalSignEnum.sagittarius:
        return AppLocalizations.of(context)!.zodiac_sa;
      case AstrologicalSignEnum.capricorn:
        return AppLocalizations.of(context)!.zodiac_cp;
      case AstrologicalSignEnum.aquarius:
        return AppLocalizations.of(context)!.zodiac_aq;
      case AstrologicalSignEnum.pisces:
        return AppLocalizations.of(context)!.zodiac_pi;
    }
  }
}
