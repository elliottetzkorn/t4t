import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/constants.dart';

class SystemButton extends StatefulWidget {
  const SystemButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.enabled = true,
      this.icon,
      this.flipIcon = false,
      this.height,
      this.moreImpactful = false,
      this.shrinkToFit = false,
      this.backgroundColor,
      this.backgroundColorTapped,
      this.foregroundColor});

  final String text;
  final bool enabled;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool flipIcon;
  final double? height;
  final bool moreImpactful;
  final bool shrinkToFit;
  final Color? backgroundColor;
  final Color? backgroundColorTapped;
  final Color? foregroundColor;

  @override
  State<SystemButton> createState() => _SystemButtonState();
}

class _SystemButtonState extends State<SystemButton> {
  bool tapped = false;

  Padding getIcon(BuildContext context) {
    return Padding(
        padding: widget.flipIcon
            ? const EdgeInsets.only(left: spacingFour)
            : const EdgeInsets.only(right: spacingFour),
        child: Icon(
          size: widget.shrinkToFit ? 16 : 18,
          widget.icon!,
          color: Theme.of(context).colorScheme.onPrimary,
        ));
  }

  void pressed() {
    widget.onPressed();
  }

  void tappedDown(TapDownDetails? t) {
    HapticFeedback.selectionClick();

    setState(() {
      tapped = true;
    });
  }

  void tappedUp(TapUpDetails? t) {
    setState(() {
      tapped = false;
    });

    widget.onPressed();
  }

  void tapCanceled() {
    setState(() {
      tapped = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: widget.enabled ? 1 : unselectedOpacity,
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapDown: widget.enabled ? tappedDown : null,
              onTapUp: widget.enabled ? tappedUp : null,
              onTapCancel: widget.enabled ? tapCanceled : null,
              child: Container(
                  constraints: const BoxConstraints(
                      minHeight: tapTarget, maxWidth: tabletWidth),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Container(
                        height: widget.height,
                        decoration: BoxDecoration(
                            color: tapped
                                ? widget.backgroundColorTapped ??
                                    Theme.of(context).colorScheme.secondary
                                : widget.backgroundColor ??
                                    Theme.of(context).colorScheme.primary,
                            borderRadius: const BorderRadius.all(
                                Radius.circular(inputRadius))),
                        padding: const EdgeInsets.symmetric(
                            horizontal: buttonWidthPadding,
                            vertical: buttonHeightPadding),
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (widget.icon != null && !widget.flipIcon)
                                getIcon(context),
                              SystemText(
                                text: widget.text,
                                color: widget.foregroundColor ??
                                    Theme.of(context).colorScheme.onPrimary,
                                size: widget.shrinkToFit
                                    ? TextSizeEnum.fifteen
                                    : TextSizeEnum.fifteen,
                              ),
                              if (widget.icon != null && widget.flipIcon)
                                getIcon(context),
                            ]))
                  ])))
        ]));
  }
}
