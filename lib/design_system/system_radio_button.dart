import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:t4t/design_system/system_text.dart';

class SystemRadioButton extends StatelessWidget {
  const SystemRadioButton(
      {super.key,
      required this.title,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  final String title;
  final dynamic value;
  final dynamic groupValue;
  final Function(dynamic) onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<dynamic>(
      dense: true,
      title: SystemText(
        text: title,
      ),
      value: value,
      groupValue: groupValue,
      onChanged: (value) {
        HapticFeedback.selectionClick();
        onChanged(value);
      },
    );
  }
}
