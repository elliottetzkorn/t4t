import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:t4t/constants.dart';
import 'package:flutter/gestures.dart';

class SystemTap extends StatelessWidget {
  const SystemTap(
      {super.key, required this.child, this.onTap, this.onLongPress});

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      behavior: HitTestBehavior.opaque,
      gestures: {
        if (onLongPress != null)
          LongPressGestureRecognizer:
              GestureRecognizerFactoryWithHandlers<LongPressGestureRecognizer>(
            () => LongPressGestureRecognizer(
              duration: const Duration(
                  milliseconds:
                      animationDuration), // Adjust the long press duration as needed
            ),
            (LongPressGestureRecognizer instance) {
              instance.onLongPress = () {
                HapticFeedback.selectionClick();
                onLongPress!();
              };
            },
          ),
        if (onTap != null)
          TapGestureRecognizer:
              GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
            () => TapGestureRecognizer(),
            (TapGestureRecognizer instance) {
              instance.onTap = () {
                HapticFeedback.selectionClick();
                onTap!();
              };
            },
          ),
      },
      child: child,
    );
  }
}
