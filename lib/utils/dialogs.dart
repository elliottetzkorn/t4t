import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/data/message_data.dart';
import 'package:t4t/design_system/system_dialog.dart';
import 'package:t4t/design_system/system_text_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/extensions/strings_extensions.dart';
import 'package:t4t/repositories/messages_repository.dart';
import 'package:timeago/timeago.dart' as timeago;

class Dialogs {
  static Future<void> message(BuildContext context, WidgetRef ref,
      MessageData message, String profileId) async {
    final String timeStamp =
        timeago.format(message.createdAt, clock: DateTime.now().toUtc());

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SystemDialog(
          subTitle: message.senderId.isOwnId()
              ? AppLocalizations.of(context)!.message_metadata_sent(timeStamp)
              : AppLocalizations.of(context)!
                  .message_metadata_received(timeStamp),
          children: <Widget>[
            if (message.senderId.isOwnId())
              SystemTextButton(
                text: AppLocalizations.of(context)!.delete,
                onPressed: message.id == null
                    ? null
                    : () {
                        MessagesRepository.delete(message.id!);
                        Navigator.of(context).pop();
                      },
              ),
          ],
        );
      },
    );
  }
}
