import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:t4t/constants.dart';

class ClosingRow extends StatelessWidget {
  const ClosingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            HapticFeedback.selectionClick();
            context.pop();
          },
          child: SizedBox(
              height: tapTarget,
              width: tapTarget,
              child: Center(
                  child: Icon(
                PhosphorIcons.x_thin,
                color: Theme.of(context).colorScheme.secondary,
                size: smallX,
              ))),
        )
      ],
    );
  }
}
