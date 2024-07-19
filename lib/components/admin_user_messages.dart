import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/design_system/system_divider.dart';
import 'package:t4t/design_system/system_error.dart';
import 'package:t4t/design_system/system_loader.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/providers/admin_user_messages_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdminUserMessages extends ConsumerWidget {
  const AdminUserMessages(
      {super.key, required this.senderId, required this.receiverId});

  final String senderId;
  final String receiverId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(adminUserMessagesProvider(senderId, receiverId));

    return Center(
        child: switch (messages) {
      AsyncData(value: final messagesValue) => messagesValue.isEmpty
          ? SystemText(text: AppLocalizations.of(context)!.no_messages)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (final message in messagesValue)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SystemText(text: message),
                      const SizedBox(height: spacingThree),
                      const SystemDivider(),
                      const SizedBox(height: spacingThree),
                    ],
                  )
              ],
            ),
      AsyncError() => SystemError(
          onPressed: () =>
              ref.invalidate(adminUserMessagesProvider(senderId, receiverId))),
      _ => const SystemLoader()
    });
  }
}
