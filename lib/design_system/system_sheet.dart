import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:t4t/constants.dart';

class SystemSheet {
  static void show(
      {required BuildContext context,
      required Widget child,
      Color? color,
      bool noBottomSafeArea = false,
      double maxHeightPercent = 0.8,
      VoidCallback? whenComplete,
      bool showClose = true}) {
    double maxHeight = MediaQuery.of(context).size.height * maxHeightPercent;

    showModalBottomSheet(
        backgroundColor: color ?? Theme.of(context).cardColor,
        isScrollControlled: true,
        elevation: 0,
        context: context,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  feedRadius,
                ),
                topRight: Radius.circular(
                  feedRadius,
                ))),
        builder: (builder) {
          return SafeArea(
              bottom: !noBottomSafeArea,
              child: Stack(children: [
                Container(
                    constraints: BoxConstraints(maxHeight: maxHeight),
                    child: child),
                if (showClose)
                  Row(
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
                  )
              ]));
        }).whenComplete(() {
      if (whenComplete != null) {
        whenComplete();
      }
    });
  }
}
