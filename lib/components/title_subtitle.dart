import 'package:flutter/material.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/constants.dart';

class TitleSubtitle extends StatelessWidget {
  const TitleSubtitle(
      {super.key,
      required this.title,
      required this.subTitle,
      this.isNav = false,
      this.clamp = false,
      this.color,
      this.includesLinks = false,
      this.contrast = false});

  final String title;
  final String subTitle;
  final bool isNav;
  final bool clamp;
  final bool includesLinks;
  final Color? color;
  final bool contrast;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SystemText(
          color: color,
          text: title,
          size: TextSizeEnum.eighteen,
        ),
        const SizedBox(height: spacingThree),
        SystemText(
          text: subTitle,
          size: TextSizeEnum.fifteen,
          color: contrast
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          maxLines: clamp ? 1 : null,
        )
      ],
    );
  }
}
