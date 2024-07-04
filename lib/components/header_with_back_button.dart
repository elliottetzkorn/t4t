import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:t4t/components/header.dart';
import 'package:t4t/components/system_tap.dart';
import 'package:t4t/design_system/system_icon_button.dart';
import 'package:t4t/constants.dart';

class HeaderWithBackButton extends StatelessWidget {
  const HeaderWithBackButton(
      {super.key, required this.title, this.color, this.titleAction});

  final String title;
  final Color? color;
  final VoidCallback? titleAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: spacingFour),
      child: Row(
        children: [
          SystemIconButton(
              icon: PhosphorIcons.arrow_left_thin,
              filledIcon: PhosphorIcons.arrow_left,
              onPressed: () => context.pop()),
          Expanded(
              child: SystemTap(
                  onTap: () => {if (titleAction != null) titleAction!()},
                  child: Header(title: title, color: color))),
          const SizedBox(width: tapTarget)
        ],
      ),
    );
  }
}
