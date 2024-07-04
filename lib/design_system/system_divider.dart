import 'package:flutter/material.dart';
import 'package:t4t/constants.dart';

class SystemDivider extends StatelessWidget {
  const SystemDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: thinLine,
      color: Theme.of(context).colorScheme.tertiary.withOpacity(0.666),
    );
  }
}
