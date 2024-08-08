import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/components/navigation_cell.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/design_system/system_dialog.dart';
import 'package:t4t/design_system/system_text_button.dart';
import 'package:t4t/enums/profile_page_pages_enum.dart';
import 'package:t4t/enums/settings_account_page_pages_enum.dart';
import 'package:t4t/extensions/profile_page_pages_enum_extensions.dart';
import 'package:t4t/extensions/settings_account_page_pages_enum_extensions.dart';
import 'package:t4t/pages/settings/settings_base_page.dart';
import 'package:t4t/providers/router_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsAccountPage extends ConsumerWidget {
  const SettingsAccountPage(
      {super.key,
      this.embedded = false,
      this.navigationCellTapped,
      required this.profile});

  final bool embedded;
  final Function? navigationCellTapped;
  final ProfileData profile;

  void handleTap(BuildContext context, WidgetRef ref,
      SettingsAccountPagePagesEnum pageTapped, bool pageEmbedded) {
    if (navigationCellTapped != null && pageEmbedded) {
      navigationCellTapped!(pageTapped);
    } else {
      switch (pageTapped) {
        case SettingsAccountPagePagesEnum.logOut:
          logOut(context, ref);
          break;

        case SettingsAccountPagePagesEnum.delete:
          deleteAccount(context, ref);
          break;
      }
    }
  }

  Future<void> deleteAccount(BuildContext inputContext, WidgetRef ref) async {
    return showDialog<void>(
      context: inputContext,
      builder: (BuildContext context) {
        return SystemDialog(
          subTitle: AppLocalizations.of(context)!.delete_dialog_body,
          children: <Widget>[
            SystemTextButton(
              text: AppLocalizations.of(context)!.no,
              profile: null,
              onPressed: () => context.pop(),
            ),
            SystemTextButton(
              text: AppLocalizations.of(context)!.yes,
              profile: null,
              onPressed: () {
                context.pop();
                _deleteProfile(inputContext)
                    .then((_) => logOut(inputContext, ref));
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteProfile(BuildContext context) async {
    await Supabase.instance.client.rpc('delete_user');
  }

  Future<void> logOut(BuildContext context, WidgetRef ref) async {
    await Supabase.instance.client.auth.signOut().then((_) {
      ref.read(routerProvider).goNamed(routeHome);
    });
  }

  void getHelp(BuildContext context) {
    launchUrl(Uri.parse(
        'mailto:support@t4t.social?subject=Settings%20Help&body=Reported%20By:%20${Supabase.instance.client.auth.currentSession!.user.id}'));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SettingsBasePage(
        title: ProfilePagePagesEnum.account.title(context),
        navCells: [
          NavigationCell(
              title: SettingsAccountPagePagesEnum.logOut.title(context),
              subTitle: SettingsAccountPagePagesEnum.logOut.subTitle(context),
              icon: PhosphorIcons.eject_thin,
              onPressed: () => handleTap(
                  context, ref, SettingsAccountPagePagesEnum.logOut, false)),
          NavigationCell(
              title: SettingsAccountPagePagesEnum.delete.title(context),
              subTitle: SettingsAccountPagePagesEnum.delete.subTitle(context),
              icon: PhosphorIcons.trash_thin,
              onPressed: () => handleTap(
                  context, ref, SettingsAccountPagePagesEnum.delete, false))
        ]);
  }
}
