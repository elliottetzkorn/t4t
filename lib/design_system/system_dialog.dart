import 'package:flutter/material.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/constants.dart';

class SystemDialog extends StatelessWidget {
  const SystemDialog({super.key, required this.children, this.subTitle});

  final List<Widget> children;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(spacingFive),
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(inputRadius))),
      content: subTitle == null
          ? null
          : SystemText(
              color: Theme.of(context).colorScheme.primary,
              text: subTitle!,
            ),
      actions: children.isEmpty ? null : children,
    );
  }
}
