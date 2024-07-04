import 'package:flutter/material.dart';
import 'package:t4t/components/system_tap.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/extensions/int_extensions.dart';

class PostTypeSelector extends StatelessWidget {
  const PostTypeSelector(
      {super.key,
      required this.onTapped,
      required this.currentCell,
      this.editPost = false});

  final Function onTapped;
  final int currentCell;
  final bool editPost;

  List<Widget> getTypes(BuildContext context) {
    List<Widget> typeWidgets = [];
    for (int i = editPost ? 1 : 0; i < postTypes.length; i++) {
      typeWidgets.add(SystemTap(
          onTap: () {
            if (postTypes[i] != currentCell) {
              onTapped(postTypes[i]);
            }
          },
          child: Container(
              decoration: BoxDecoration(
                  color: currentCell == postTypes[i]
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(inputRadius)),
              padding: const EdgeInsets.symmetric(
                  horizontal: buttonWidthPadding,
                  vertical: buttonHeightPadding),
              child: SystemText(
                  color: currentCell == postTypes[i]
                      ? Theme.of(context).scaffoldBackgroundColor
                      : Theme.of(context).colorScheme.primary,
                  text: editPost
                      ? postTypes[i].toPostTypeSingular(context).toLowerCase()
                      : postTypes[i]
                          .toPostTypePlural(context)
                          .toLowerCase()))));
    }

    return typeWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Wrap(
            alignment: WrapAlignment.start,
            spacing: spacingFour,
            runSpacing: spacingFour,
            children: getTypes(context)));
  }
}
