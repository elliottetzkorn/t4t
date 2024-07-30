import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:t4t/design_system/system_badge.dart';
import 'package:t4t/constants.dart';

enum SystemIconButtonSize { small, regular, large }

class SystemIconButton extends StatefulWidget {
  const SystemIconButton(
      {super.key,
      required this.icon,
      required this.filledIcon,
      required this.onPressed,
      this.size = SystemIconButtonSize.regular,
      this.shortClick = false,
      this.enabled = true,
      this.notifColors = const [],
      this.focused = false});

  final IconData icon;
  final IconData filledIcon;
  final VoidCallback onPressed;
  final SystemIconButtonSize size;
  final bool shortClick;
  final bool enabled;
  final List<Color> notifColors;
  final bool focused;

  @override
  State<SystemIconButton> createState() => _SystemIconButtonState();
}

class _SystemIconButtonState extends State<SystemIconButton> {
  bool tapped = false;
  double iconSize = 34;

  void tappedDown(TapDownDetails? t) {
    if (widget.enabled) {
      setState(() {
        tapped = true;
      });
    }
  }

  void tappedUp(TapUpDetails? t) {
    if (widget.enabled) {
      setState(() {
        tapped = false;
      });
    }

    if (widget.icon != PhosphorIcons.arrow_left_thin && widget.enabled) {
      if (widget.size == SystemIconButtonSize.large) {
        HapticFeedback.lightImpact();
      } else {
        HapticFeedback.selectionClick();
      }
    }

    if (widget.enabled) {
      widget.onPressed();
    }
  }

  void tapCanceled() {
    setState(() {
      tapped = false;
    });
  }

  double getWidth() {
    switch (widget.size) {
      case SystemIconButtonSize.small:
        return tapTarget / goldenRatio;
      case SystemIconButtonSize.regular:
        return tapTarget;
      case SystemIconButtonSize.large:
        return tapTarget;
    }
  }

  double getMaxWidth() {
    switch (widget.size) {
      case SystemIconButtonSize.small:
      case SystemIconButtonSize.regular:
        return tapTarget;
      case SystemIconButtonSize.large:
        return tapTarget;
    }
  }

  double getIconSize() {
    switch (widget.size) {
      case SystemIconButtonSize.small:
        return iconSize / goldenRatio;
      case SystemIconButtonSize.regular:
        return iconSize;
      case SystemIconButtonSize.large:
        return iconSize * goldenRatio;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: tappedDown,
        onTapUp: tappedUp,
        onTapCancel: tapCanceled,
        child: SizedBox(
            height: getMaxWidth(),
            width: getMaxWidth(),
            child: Center(
                child: SizedBox(
                    height: getWidth(),
                    width: getWidth(),
                    child: Stack(children: [
                      Center(
                          child: Icon(
                              widget.focused || tapped
                                  ? widget.filledIcon
                                  : widget.icon,
                              size: getIconSize(),
                              color: Theme.of(context).colorScheme.primary)),
                      if (widget.notifColors.isNotEmpty)
                        SystemBadge(colors: widget.notifColors)
                    ])))));
  }
}
