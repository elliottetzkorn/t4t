import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:t4t/components/empty_page.dart';
import 'package:t4t/components/header.dart';
import 'package:t4t/components/system_tap.dart';
import 'package:t4t/components/username_flair.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/conversation_data.dart';
import 'package:t4t/design_system/system_badge.dart';
import 'package:t4t/design_system/system_dialog.dart';
import 'package:t4t/design_system/system_error.dart';
import 'package:t4t/design_system/system_loader.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/design_system/system_text_button.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/extensions/color_extensions.dart';
import 'package:t4t/pages/messages/messages_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/providers/conversations_provider.dart';
import 'package:t4t/providers/resolved_brightness_provider.dart';
import 'package:t4t/providers/router_provider.dart';

class ConversationsPage extends ConsumerWidget {
  const ConversationsPage({super.key, required this.scrollController});

  final ScrollController scrollController;

  void goToMessage(WidgetRef ref, ConversationData conversationData) {
    ref.read(routerProvider).pushNamed(routemMessages,
        extra: MessagePageData(
            profile: conversationData.profile,
            unread: conversationData.unread));
  }

  Future<void> launchDeleteConversationDialog(
      BuildContext context, String profileId, WidgetRef ref) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SystemDialog(
          subTitle:
              AppLocalizations.of(context)!.delete_conversation_dialog_body,
          children: <Widget>[
            SystemTextButton(
                text: AppLocalizations.of(context)!.no,
                onPressed: () {
                  context.pop();
                }),
            SystemTextButton(
              text: AppLocalizations.of(context)!.yes,
              onPressed: () {
                ref.read(conversationsProvider.notifier).delete(profileId);
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversations = ref.watch(conversationsProvider);

    return Center(
      child: switch (conversations) {
        AsyncData(:final value) => value.isEmpty
            ? EmptyPage(
                header: Header(title: AppLocalizations.of(context)!.messages),
                title: AppLocalizations.of(context)!
                    .messages_no_conversations_title,
                image: const AssetImage('images/bunnies2.png'))
            : ListView.builder(
                itemCount: value.length,
                controller: scrollController,
                padding: const EdgeInsets.only(bottom: spacingSeven),
                itemBuilder: (context, i) {
                  return Builder(builder: (context) {
                    final conversation = value[i];

                    if (i == value.length - 1 && value.length % fetchQty == 0) {
                      ref.read(conversationsProvider.notifier).scroll();
                    }

                    return Column(children: [
                      if (i == 0)
                        Header(
                          title: AppLocalizations.of(context)!.messages,
                        ),
                      SystemTap(
                          onLongPress: () => launchDeleteConversationDialog(
                              context, conversation.profile.id, ref),
                          onTap: () => goToMessage(ref, conversation),
                          child: Container(
                              padding: const EdgeInsets.all(spacingFive),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (conversation.unread)
                                      Row(
                                        children: [
                                          SystemBadge(colors: [
                                            conversation.profile.color.adjusted(
                                                ref.watch(
                                                    resolvedBrightnessProvider))
                                          ]),
                                          const SizedBox(
                                            width: spacingFive,
                                          )
                                        ],
                                      ),
                                    Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                          UsernameFlair(
                                              profile: conversation.profile),
                                          const SizedBox(height: spacingThree),
                                          SystemText(
                                              maxLines: 1,
                                              size: TextSizeEnum.fifteen,
                                              text: conversation.text == null
                                                  ? AppLocalizations.of(
                                                          context)!
                                                      .messages_no_messages_yet
                                                  : conversation.text!)
                                        ])),
                                    Row(children: [
                                      const SizedBox(
                                        width: spacingFive,
                                      ),
                                      Icon(PhosphorIcons.arrow_right_thin,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)
                                    ])
                                  ]))),
                      if (i == value.length - 1 && value.length % fetchQty == 0)
                        const SystemLoader()
                    ]);
                  });
                }),
        AsyncError() => Column(children: [
            Header(
              title: AppLocalizations.of(context)!.messages,
            ),
            SystemError(onPressed: () => ref.invalidate(conversationsProvider))
          ]),
        _ => Column(children: [
            Header(
              title: AppLocalizations.of(context)!.messages,
            ),
            const Expanded(child: SystemLoader())
          ]),
      },
    );
  }
}
