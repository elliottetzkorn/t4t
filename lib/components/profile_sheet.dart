import 'package:flutter/material.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/data/profile_min_data.dart';
import 'package:t4t/design_system/system_sheet.dart';
import 'package:t4t/pages/profile_sheet_page.dart';

class ProfileSheet {
  ProfileSheet();

  void show(BuildContext context, ProfileMinData profile, bool inChat,
      bool authenticated, VoidCallback replyPressed, ProfileData? fullProfile) {
    SystemSheet.show(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        maxHeightPercent: 0.85,
        whenComplete: () {},
        noBottomSafeArea: true,
        context: context,
        child: ProfileSheetPage(
          authenticated: authenticated,
          replyPressed: replyPressed,
          inChat: inChat,
          profile: profile,
          fullProfile: fullProfile,
        ));
  }
}
