import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:t4t/components/title_subtitle.dart';
import 'package:t4t/design_system/system_switch.dart';
import 'package:t4t/constants.dart';

class SwitchCell extends StatelessWidget {
  const SwitchCell(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.switchValue,
      required this.onPressed});

  final String title;
  final String subTitle;
  final bool switchValue;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          HapticFeedback.selectionClick();
          onPressed();
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: spacingFive),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: TitleSubtitle(title: title, subTitle: subTitle)),
                const SizedBox(
                  width: spacingFive,
                ),
                SystemSwitch(
                  value: switchValue,
                  onChanged: (_) {
                    HapticFeedback.selectionClick();
                    onPressed();
                  },
                )
              ],
            )));
  }
}
