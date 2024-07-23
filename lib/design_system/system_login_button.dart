import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/constants.dart';

class SystemLoginButton extends StatelessWidget {
  const SystemLoginButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.icon});

  final String text;
  final VoidCallback onPressed;
  final IconData icon;

  Color foregroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.primary;
  }

  Color backgroundColor(BuildContext context) {
    return Theme.of(context).scaffoldBackgroundColor;
  }

  Padding getIcon(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: spacingFour),
        child: Icon(
          size: 18,
          icon,
          color: foregroundColor(context),
        ));
  }

  void pressed() {
    HapticFeedback.selectionClick();
    onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => pressed(),
        child: Container(
            height: elevatedButtonHeight,
            decoration: BoxDecoration(
                color: backgroundColor(context),
                borderRadius:
                    const BorderRadius.all(Radius.circular(inputRadius))),
            padding: const EdgeInsets.symmetric(
                horizontal: spacingFive, vertical: spacingFour),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  getIcon(context),
                  SystemText(
                    text: text,
                    color: foregroundColor(context),
                    size: TextSizeEnum.fifteen,
                  ),
                ])));
  }
}
