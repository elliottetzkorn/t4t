import 'package:flutter/material.dart';
import 'package:t4t/design_system/system_linkable_text.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/constants.dart';

class ChatCell extends StatelessWidget {
const ChatCell(
      {super.key,
      required this.text,
      this.alignment = MainAxisAlignment.center,
      this.fontWeight = FontWeight.bold,
      this.verticalPadding = 6,
      this.fontSize = TextSizeEnum.fifteen});

  final String text;
  final MainAxisAlignment alignment;
  final FontWeight fontWeight;
  final double verticalPadding;

  final TextSizeEnum fontSize;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: alignment,
      children: <Widget>[
        if (alignment == MainAxisAlignment.end)
          const SizedBox(width: spacingEight),
        Flexible(
            fit: FlexFit.loose,
            child: SystemLinkableText(
              text: text.trim(),
              maxLines: 999,
              align: TextAlign.left,
              size: fontSize,
            )),
        if (alignment == MainAxisAlignment.start)
          const SizedBox(width: spacingEight)
      ],
    );
  }
}
