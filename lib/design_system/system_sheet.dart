import 'package:flutter/material.dart';
import 'package:t4t/components/closing_row.dart';
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
                if (showClose) const ClosingRow()
              ]));
        }).whenComplete(() {
      if (whenComplete != null) {
        whenComplete();
      }
    });
  }
}
