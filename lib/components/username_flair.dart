import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/data/profile_min_data.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/extensions/color_extensions.dart';
import 'package:t4t/extensions/profile_min_extensions.dart';
import 'package:t4t/providers/resolved_brightness_provider.dart';

class UsernameFlair extends ConsumerWidget {
  const UsernameFlair({super.key, required this.profile});

  final ProfileMinData profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SystemText(
      text: profile.decoratedUsername(),
      color: profile.color.adjusted(ref.watch(resolvedBrightnessProvider)),
    );
  }
}
