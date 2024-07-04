import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/enums/profile_page_pages_enum.dart';

extension StringParsing on ProfilePagePagesEnum {
  String title(BuildContext context) {
    switch (this) {
      case ProfilePagePagesEnum.preview:
        return AppLocalizations.of(context)!.profile_page_preview_title;
      case ProfilePagePagesEnum.account:
        return AppLocalizations.of(context)!.settings_account_title;
      case ProfilePagePagesEnum.github:
        return AppLocalizations.of(context)!.feedback;
      case ProfilePagePagesEnum.documents:
        return AppLocalizations.of(context)!.settings_account_documents_title;
      case ProfilePagePagesEnum.customization:
        return AppLocalizations.of(context)!.settings_accessibility_title;
      case ProfilePagePagesEnum.reactions:
        return AppLocalizations.of(context)!.settings_reactions_title;
    }
  }

  String subTitle(BuildContext context) {
    switch (this) {
      case ProfilePagePagesEnum.preview:
        return AppLocalizations.of(context)!.profile_page_preview_subtitle;
      case ProfilePagePagesEnum.account:
        return AppLocalizations.of(context)!.settings_account_subtitle;
      case ProfilePagePagesEnum.github:
        return AppLocalizations.of(context)!.socials_instagram_subtitle;
      case ProfilePagePagesEnum.documents:
        return AppLocalizations.of(context)!
            .settings_account_documents_subtitle;
      case ProfilePagePagesEnum.customization:
        return AppLocalizations.of(context)!.settings_accessibility_subtitle;
      case ProfilePagePagesEnum.reactions:
        return AppLocalizations.of(context)!.settings_notifs_subtitle;
    }
  }
}
