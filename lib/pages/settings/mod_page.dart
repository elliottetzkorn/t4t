import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:t4t/components/admin_user_messages.dart';
import 'package:t4t/components/admin_user_posts.dart';
import 'package:t4t/components/empty_page.dart';
import 'package:t4t/components/header_with_back_button.dart';
import 'package:t4t/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/design_system/system_button.dart';
import 'package:t4t/design_system/system_dialog.dart';
import 'package:t4t/design_system/system_error.dart';
import 'package:t4t/design_system/system_loader.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/design_system/system_text_button.dart';
import 'package:t4t/providers/reports_provider.dart';

class ModPage extends ConsumerWidget {
  const ModPage({super.key, this.embedded = false, this.navigationCellTapped});

  final bool embedded;
  final Function? navigationCellTapped;

  Future<void> banUser(
      BuildContext inputContext, WidgetRef ref, String pid) async {
    return showDialog<void>(
      context: inputContext,
      builder: (BuildContext context) {
        return SystemDialog(
          subTitle: AppLocalizations.of(context)!.ban_dialog_body,
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
                ref.read(reportsProvider.notifier).banUser(pid);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reports = ref.watch(reportsProvider);

    return Scaffold(
      body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
            HeaderWithBackButton(
                title: AppLocalizations.of(context)!.profile_page_mod_title),
            const SizedBox(
              height: spacingFour,
            ),
            Expanded(
                child: switch (reports) {
              AsyncData(value: final reportsValue) => reportsValue.isEmpty
                  ? EmptyPage(
                      title: AppLocalizations.of(context)!.reports_page_empty,
                      image: const AssetImage('images/bunnies1.png'))
                  : SingleChildScrollView(
                      padding:
                          const EdgeInsets.symmetric(horizontal: spacingFour),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SystemText(
                              text: reportsValue.length > 1
                                  ? AppLocalizations.of(context)!
                                      .reports_count(reportsValue.length - 1)
                                  : AppLocalizations.of(context)!.final_report),
                          const SizedBox(
                            height: spacingFour,
                          ),
                          SystemText(
                              text: AppLocalizations.of(context)!.recent_posts),
                          const SizedBox(
                            height: spacingFour,
                          ),
                          AdminUserPosts(pid: reportsValue.first.receiverId),
                          const SizedBox(
                            height: spacingFour,
                          ),
                          SystemText(
                              text: AppLocalizations.of(context)!
                                  .recent_messages),
                          const SizedBox(
                            height: spacingFour,
                          ),
                          Column(
                            children: <Widget>[
                              for (final id in reportsValue.first.senderIds)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    AdminUserMessages(
                                        senderId: reportsValue.first.receiverId,
                                        receiverId: id),
                                    const SizedBox(height: spacingTwo),
                                  ],
                                )
                            ],
                          ),
                          const SizedBox(
                            height: spacingSix,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SystemTextButton(
                                text: AppLocalizations.of(context)!.pardon,
                                onPressed: () => ref
                                    .read(reportsProvider.notifier)
                                    .pardonUser(reportsValue.first.receiverId),
                              ),
                              const SizedBox(
                                width: spacingFour,
                              ),
                              SystemButton(
                                text: AppLocalizations.of(context)!.ban,
                                onPressed: () => banUser(context, ref,
                                    reportsValue.first.receiverId),
                              )
                            ],
                          )
                        ],
                      )),
              AsyncError() =>
                SystemError(onPressed: () => ref.invalidate(reportsProvider)),
              _ => const Center(child: SystemLoader())
            })
          ])),
    );
  }
}
