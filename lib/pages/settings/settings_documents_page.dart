import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/navigation_cell.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/enums/profile_page_pages_enum.dart';
import 'package:t4t/enums/settings_documents_page_pages_enum.dart';
import 'package:t4t/extensions/profile_page_pages_enum_extensions.dart';
import 'package:t4t/extensions/settings_documents_page_pages_enum_extensions.dart';
import 'package:t4t/pages/settings/settings_base_page.dart';
import 'package:t4t/providers/router_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsDocumentsPage extends ConsumerStatefulWidget {
  const SettingsDocumentsPage(
      {super.key, this.embedded = false, this.navigationCellTapped});

  final bool embedded;
  final Function? navigationCellTapped;

  @override
  ConsumerState<SettingsDocumentsPage> createState() =>
      _SettingsDocumentsPageState();
}

class _SettingsDocumentsPageState extends ConsumerState<SettingsDocumentsPage> {
  void handleTap(WidgetRef ref, SettingsDocumentsPagePagesEnum pageTapped,
      bool pageEmbedded) {
    if (widget.navigationCellTapped != null && pageEmbedded) {
      widget.navigationCellTapped!(pageTapped);
    } else {
      switch (pageTapped) {
        case SettingsDocumentsPagePagesEnum.privacy:
          launchUrl(Uri.parse('https://t4t.social/privacy'),
              mode: LaunchMode.platformDefault);
          break;

        case SettingsDocumentsPagePagesEnum.licenses:
          ref.read(routerProvider).pushNamed(routeSettingsLicenses);
          break;

        case SettingsDocumentsPagePagesEnum.terms:
          launchUrl(Uri.parse('https://t4t.social/terms'),
              mode: LaunchMode.platformDefault);
          break;
        case SettingsDocumentsPagePagesEnum.colophon:
          launchUrl(Uri.parse('https://t4t.social/colophon'),
              mode: LaunchMode.platformDefault);
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SettingsBasePage(
        title: ProfilePagePagesEnum.documents.title(context),
        navCells: [
          NavigationCell(
              embedded: true,
              title: SettingsDocumentsPagePagesEnum.licenses.title(context),
              subTitle:
                  SettingsDocumentsPagePagesEnum.licenses.subTitle(context),
              onPressed: () => handleTap(
                  ref, SettingsDocumentsPagePagesEnum.licenses, false)),
          NavigationCell(
              embedded: false,
              title: SettingsDocumentsPagePagesEnum.colophon.title(context),
              subTitle:
                  SettingsDocumentsPagePagesEnum.colophon.subTitle(context),
              icon: PhosphorIcons.arrow_up_right_thin,
              onPressed: () => handleTap(
                  ref, SettingsDocumentsPagePagesEnum.colophon, false)),
          NavigationCell(
              embedded: true,
              title: SettingsDocumentsPagePagesEnum.privacy.title(context),
              subTitle:
                  SettingsDocumentsPagePagesEnum.privacy.subTitle(context),
              icon: PhosphorIcons.arrow_up_right_thin,
              onPressed: () => handleTap(
                  ref, SettingsDocumentsPagePagesEnum.privacy, false)),
          NavigationCell(
              embedded: true,
              title: SettingsDocumentsPagePagesEnum.terms.title(context),
              subTitle: SettingsDocumentsPagePagesEnum.terms.subTitle(context),
              icon: PhosphorIcons.arrow_up_right_thin,
              onPressed: () =>
                  handleTap(ref, SettingsDocumentsPagePagesEnum.terms, false))
        ]);
  }
}
