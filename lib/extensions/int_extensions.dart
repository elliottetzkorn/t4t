import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/enums/astrological_sign_enum.dart';

extension PostTypeParsing on int {
  String toPostTypeSingular(BuildContext context) {
    switch (this) {
      case 1:
        return AppLocalizations.of(context)!.post_type_thought_singular;
      case 2:
        return AppLocalizations.of(context)!.post_type_hookup_singular;
      case 3:
        return AppLocalizations.of(context)!.post_type_event_singular;
      case 4:
        return AppLocalizations.of(context)!.post_type_community_singular;
      case 5:
        return AppLocalizations.of(context)!.post_type_aid_singular;
      case 6:
        return AppLocalizations.of(context)!.post_type_transition_singular;
      case 7:
        return AppLocalizations.of(context)!.post_type_poem_singular;
      case 8:
        return AppLocalizations.of(context)!.post_type_date_singular;
      case 9:
        return AppLocalizations.of(context)!.post_type_vent_singular;
      default:
        return AppLocalizations.of(context)!.post_type_post_singular;
    }
  }

  String toPostTypePlural(BuildContext context) {
    switch (this) {
      case 1:
        return AppLocalizations.of(context)!.post_type_thought_plural;
      case 2:
        return AppLocalizations.of(context)!.post_type_hookup_plural;
      case 3:
        return AppLocalizations.of(context)!.post_type_event_plural;
      case 4:
        return AppLocalizations.of(context)!.post_type_community_singular;
      case 5:
        return AppLocalizations.of(context)!.post_type_aid_singular;
      case 6:
        return AppLocalizations.of(context)!.post_type_transition_plural;
      case 7:
        return AppLocalizations.of(context)!.post_type_poem_plural;
      case 8:
        return AppLocalizations.of(context)!.post_type_date_plural;
      case 9:
        return AppLocalizations.of(context)!.post_type_vent_plural;
      default:
        return AppLocalizations.of(context)!.post_type_all_posts_plural;
    }
  }
}

extension AstrologicalSignEnumParsing on int {
  AstrologicalSignEnum toAstrologicalSign() {
    switch (this) {
      case 1:
        return AstrologicalSignEnum.aries;
      case 2:
        return AstrologicalSignEnum.taurus;
      case 3:
        return AstrologicalSignEnum.gemini;
      case 4:
        return AstrologicalSignEnum.cancer;
      case 5:
        return AstrologicalSignEnum.leo;
      case 6:
        return AstrologicalSignEnum.virgo;
      case 7:
        return AstrologicalSignEnum.libra;
      case 8:
        return AstrologicalSignEnum.scorpio;
      case 9:
        return AstrologicalSignEnum.sagittarius;
      case 10:
        return AstrologicalSignEnum.capricorn;
      case 11:
        return AstrologicalSignEnum.aquarius;
      case 12:
      default:
        return AstrologicalSignEnum.pisces;
    }
  }
}
