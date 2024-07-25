import 'dart:async';

import 'package:flutter/material.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SystemLoader extends StatefulWidget {
  const SystemLoader({super.key, this.color});

  final Color? color;

  @override
  State<SystemLoader> createState() => _SystemLoaderState();
}

class _SystemLoaderState extends State<SystemLoader> {
  String dots = '.';
  late Timer timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(milliseconds: animationDuration),
        (Timer t) {
      setState(() {
        if (dots.length > 2) {
          dots = '.';
        } else {
          dots += '.';
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(spacingFive),
          child: SystemText(
            text: '${AppLocalizations.of(context)!.loading}$dots',
            color: widget.color ?? Theme.of(context).colorScheme.secondary,
          )),
    );
  }
}
