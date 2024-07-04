import 'package:flutter/material.dart';
import 'package:t4t/constants.dart';

class SystemActionPage extends StatelessWidget {
  const SystemActionPage(
      {super.key,
      required this.body,
      required this.action,
      this.scrollController});

  final Widget body;
  final Widget action;

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
              child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: spacingFive,
                          left: spacingFive,
                          right: spacingFive,
                          bottom: spacingSix),
                      child: body))),
          Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: thinLine,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(spacingFour), child: action)
                ],
              )),
        ]);
  }
}
