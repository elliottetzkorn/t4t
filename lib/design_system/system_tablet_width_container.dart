import 'package:flutter/material.dart';
import 'package:t4t/constants.dart';

class SystemTabletWidthContainer extends StatelessWidget {
  const SystemTabletWidthContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Flexible(
          fit: FlexFit.loose,
          child: Container(
            constraints: const BoxConstraints(maxWidth: tabletWidth),
            child: child,
          ))
    ]);
  }
}
