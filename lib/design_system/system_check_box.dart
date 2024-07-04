import 'package:flutter/material.dart';
import 'package:t4t/components/system_tap.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/constants.dart';

class SystemCheckBox extends StatelessWidget {
  const SystemCheckBox(
      {super.key,
      required this.onPressed,
      required this.selected,
      required this.color,
      required this.text});

  final VoidCallback? onPressed;
  final bool selected;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SystemTap(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
              color:
                  selected ? color : Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(inputRadius)),
          padding: const EdgeInsets.symmetric(
              horizontal: buttonWidthPadding, vertical: buttonHeightPadding),
          child: SystemText(
            text: text,
            color: selected ? Theme.of(context).scaffoldBackgroundColor : color,
          ),
        ));
  }
}
