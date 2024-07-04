import 'package:flutter/material.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/constants.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title, this.color});

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: spacingFive),
        height: spacingEight,
        child: Center(
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SystemText(
                  align: TextAlign.center,
                  text: title,
                  color: color ?? Theme.of(context).colorScheme.primary,
                  size: TextSizeEnum.twentyNine,
                ))));
  }
}
