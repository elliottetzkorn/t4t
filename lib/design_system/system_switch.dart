import 'package:flutter/material.dart';
import 'package:t4t/constants.dart';

class SystemSwitch extends StatelessWidget {
  const SystemSwitch({super.key, required this.value, required this.onChanged});

  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
      trackOutlineWidth:
          WidgetStateProperty.resolveWith<double?>((Set<WidgetState> states) {
        return line; // Use the default width.
      }),
      value: value,
      onChanged: onChanged,
    );
  }
}
