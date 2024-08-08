import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/enums/settings_documents_page_pages_enum.dart';

extension StringParsing on SettingsDocumentsPagePagesEnum {
  String title(BuildContext context) {
    switch (this) {
      case SettingsDocumentsPagePagesEnum.github:
        return AppLocalizations.of(context)!.feedback;
      case SettingsDocumentsPagePagesEnum.licenses:
        return AppLocalizations.of(context)!.settings_account_licenses_title;
      case SettingsDocumentsPagePagesEnum.privacy:
        return AppLocalizations.of(context)!
            .settings_account_documents_privacy_title;
      case SettingsDocumentsPagePagesEnum.terms:
        return AppLocalizations.of(context)!
            .settings_account_documents_terms_title;
      case SettingsDocumentsPagePagesEnum.colophon:
        return AppLocalizations.of(context)!.settings_hat_tip_title;
    }
  }

  String subTitle(BuildContext context) {
    switch (this) {
      case SettingsDocumentsPagePagesEnum.github:
        return AppLocalizations.of(context)!.socials_instagram_subtitle;
      case SettingsDocumentsPagePagesEnum.licenses:
        return AppLocalizations.of(context)!.settings_account_licenses_subtitle;
      case SettingsDocumentsPagePagesEnum.privacy:
        return AppLocalizations.of(context)!
            .settings_account_documents_privacy_subtitle;
      case SettingsDocumentsPagePagesEnum.terms:
        return AppLocalizations.of(context)!
            .settings_account_documents_terms_subtitle;
      case SettingsDocumentsPagePagesEnum.colophon:
        return AppLocalizations.of(context)!.settings_hat_tip_subtitle;
    }
  }
}
