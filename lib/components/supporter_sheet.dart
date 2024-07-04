import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:t4t/design_system/system_action_page.dart';
import 'package:t4t/design_system/system_button.dart';
import 'package:t4t/design_system/system_sheet.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/providers/subscribing_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/utils/supporter_utils.dart';

class SupporterSheet {
  SupporterSheet();

  void show(BuildContext context, WidgetRef ref) {
    SystemSheet.show(
        showClose: false,
        context: context,
        child: SystemActionPage(
            body: SystemText(
                text: AppLocalizations.of(context)!.supporter_explanation),
            action: Column(children: [
              SystemButton(
                  text: AppLocalizations.of(context)!.supporter_cta,
                  onPressed: () {
                    if (!ref.read(subscribingProvider)) {
                      SupporterUtils.attemptPurchase(context, ref);
                    }

                    context.pop();
                  }),
            ])));
  }
}
