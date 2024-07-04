import 'package:flutter/material.dart';
import 'package:t4t/components/header_with_back_button.dart';
import 'package:t4t/constants.dart';

class SettingsBasePage extends StatelessWidget {
  const SettingsBasePage(
      {super.key, required this.title, required this.navCells});

  final String title;
  final List<Widget> navCells;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
          HeaderWithBackButton(title: title),
          const SizedBox(
            height: spacingFour,
          ),
          Expanded(
              child: ListView(
            primary: false,
            shrinkWrap: true,
            children: navCells,
          ))
        ])));
  }
}
