import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/design_system/system_text_button.dart';
import 'package:t4t/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Banned extends StatelessWidget {
  const Banned({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
          padding: const EdgeInsets.all(spacingSix),
          child: Column(children: [
            SystemText(text: AppLocalizations.of(context)!.ban_screen),
            const SizedBox(
              height: spacingFive,
            ),
            SystemTextButton(
              text: AppLocalizations.of(context)!.send_email,
              onPressed: () {
                launchUrl(Uri.parse(
                    'mailto:support@t4t.social?subject=User%20Banned&body=Reported%20By:%20${Supabase.instance.client.auth.currentSession!.user.id}'));
              },
            )
          ]))
    ])));
  }
}
