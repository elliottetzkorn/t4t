import 'package:flutter/material.dart';
import 'package:t4t/design_system/system_sheet.dart';
import 'package:t4t/pages/login_page.dart';

class LoginSheet {
  const LoginSheet({required this.context});

  final BuildContext context;

  void show() {
    SystemSheet.show(
        noBottomSafeArea: true, context: context, child: const LoginPage());
  }
}
