import 'package:flutter/material.dart';
import 'package:t4t/design_system/system_tablet_width_container.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/constants.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage(
      {super.key,
      required this.header,
      required this.title,
      required this.image});

  final Widget header;
  final String title;
  final AssetImage image;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      header,
      Expanded(
          child: Center(
              child: SystemTabletWidthContainer(
                  child: Padding(
                      padding: const EdgeInsets.all(spacingSix),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(fit: BoxFit.fill, image: image),
                            const SizedBox(height: spacingSix),
                            SystemText(
                              text: title,
                            ),
                          ])))))
    ]);
  }
}
