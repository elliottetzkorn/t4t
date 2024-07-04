import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/empty_page.dart';
import 'package:t4t/components/header.dart';
import 'package:t4t/components/profile_sheet.dart';
import 'package:t4t/components/system_tap.dart';
import 'package:t4t/components/username_flair.dart';
import 'package:t4t/components/view_post_sheet.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/post_min_data.dart';
import 'package:t4t/data/profile_min_data.dart';
import 'package:t4t/design_system/system_error.dart';
import 'package:t4t/design_system/system_loader.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/enums/profile_page_pages_enum.dart';
import 'package:t4t/extensions/profile_page_pages_enum_extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/providers/notifications_provider.dart';

class ReactionsPage extends ConsumerWidget {
  const ReactionsPage({super.key, required this.scrollController});

  final ScrollController scrollController;

  void goToProfile(BuildContext context, ProfileMinData profile) {
    ProfileSheet().show(context, profile, false, true, () {}, null);
  }

  void goToPost(
      BuildContext context, ProfileMinData profile, PostMinData post) {
    ViewPostSheet().show(context, post);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationsProvider);

    return Center(
      child: switch (notifications) {
        AsyncData(:final value) => value.isEmpty
            ? EmptyPage(
                header: Header(
                    title: ProfilePagePagesEnum.reactions.title(context)),
                title: AppLocalizations.of(context)!.messages_no_notifs_title,
                image: const AssetImage('images/bunnies3.png'))
            : ListView.builder(
                controller: scrollController,
                itemCount: value.length,
                padding: const EdgeInsets.only(bottom: spacingSeven),
                itemBuilder: (context, i) {
                  return Builder(builder: (context) {
                    final notif = value[i];

                    if (i == value.length - 1 && value.length % fetchQty == 0) {
                      ref.read(notificationsProvider.notifier).scroll();
                    }

                    return Column(children: [
                      if (i == 0)
                        Padding(
                            padding: const EdgeInsets.only(bottom: spacingFour),
                            child: Header(
                              title:
                                  ProfilePagePagesEnum.reactions.title(context),
                            )),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacingFive, vertical: spacingFour),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SystemTap(
                                  onTap: () =>
                                      goToProfile(context, notif.profile),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        UsernameFlair(
                                          profile: notif.profile,
                                        ),
                                        SystemText(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          text: " ${notif.likeText}'d: ",
                                        )
                                      ])),
                              Expanded(
                                  child: SystemTap(
                                      onTap: () => {
                                            goToPost(context, notif.profile,
                                                notif.post)
                                          },
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: SystemText(
                                              maxLines: 1,
                                              underline: true,
                                              text: value[i].post.title))))
                            ],
                          )),
                      if (i == value.length - 1 && value.length % fetchQty == 0)
                        const SystemLoader()
                    ]);
                  });
                }),
        AsyncError() => Column(children: [
            Header(
              title: ProfilePagePagesEnum.reactions.title(context),
            ),
            SystemError(onPressed: () => ref.invalidate(notificationsProvider))
          ]),
        _ => Column(children: [
            Header(
              title: ProfilePagePagesEnum.reactions.title(context),
            ),
            const Expanded(child: SystemLoader())
          ]),
      },
    );
  }
}
