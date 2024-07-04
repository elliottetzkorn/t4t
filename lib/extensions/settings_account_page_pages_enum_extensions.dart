import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/enums/settings_account_page_pages_enum.dart';

extension StringParsing on SettingsAccountPagePagesEnum {
  String title(BuildContext context) {
    switch (this) {
      case SettingsAccountPagePagesEnum.logOut:
        return AppLocalizations.of(context)!
            .settings_account_log_out_users_title;
      case SettingsAccountPagePagesEnum.delete:
        return AppLocalizations.of(context)!
            .settings_account_delete_users_title;
      case SettingsAccountPagePagesEnum.restoreSubscription:
        return AppLocalizations.of(context)!.restore_subscription;
    }
  }

  String subTitle(BuildContext context) {
    switch (this) {
      case SettingsAccountPagePagesEnum.logOut:
        return AppLocalizations.of(context)!
            .settings_account_log_out_users_subtitle;
      case SettingsAccountPagePagesEnum.delete:
        return AppLocalizations.of(context)!
            .settings_account_delete_users_subtitle;
      case SettingsAccountPagePagesEnum.restoreSubscription:
        return AppLocalizations.of(context)!.restore_subscription_subtitle;
    }
  }
}
