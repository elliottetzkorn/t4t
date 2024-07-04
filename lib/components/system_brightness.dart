import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/providers/resolved_brightness_provider.dart';

class SystemBrightness extends ConsumerStatefulWidget {
  const SystemBrightness({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<SystemBrightness> createState() => _SystemBrightnessState();
}

class _SystemBrightnessState extends ConsumerState<SystemBrightness>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();

    ref.read(resolvedBrightnessProvider.notifier).platformBrightnessChanged(
        View.of(context).platformDispatcher.platformBrightness);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
