import 'package:flutter/material.dart';
import 'package:t4t/components/setup_header.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/design_system/system_tablet_width_container.dart';
import 'package:t4t/constants.dart';

class SetupPage extends StatelessWidget {
  const SetupPage(
      {super.key,
      required this.body,
      required this.action,
      this.closable = false,
      required this.profile});

  final Widget body;
  final Widget action;
  final bool closable;
  final ProfileData profile;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      Expanded(
          child: Padding(
              padding: const EdgeInsets.all(spacingFive),
              child: Column(
                children: [
                  SetupHeader(closable: closable, profile: profile),
                  Expanded(
                      child: SystemTabletWidthContainer(
                          child: Center(
                              child: SingleChildScrollView(child: body))))
                ],
              ))),
      Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: thinLine,
              ),
              Padding(padding: const EdgeInsets.all(spacingFour), child: action)
            ],
          )),
    ]));
  }
}
