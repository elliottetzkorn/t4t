import 'dart:async';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/components/save_button.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/design_system/system_action_page.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/extensions/color_extensions.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/providers/profile_provider.dart';
import 'package:t4t/providers/resolved_brightness_provider.dart';

class SettingsColorPage extends ConsumerStatefulWidget {
  const SettingsColorPage({super.key, required this.profile});

  final ProfileData profile;

  @override
  ConsumerState<SettingsColorPage> createState() => _SettingsColorPageState();
}

class _SettingsColorPageState extends ConsumerState<SettingsColorPage> {
  var _saving = false;
  Color? color;

  bool showBody() {
    return !_saving;
  }

  Future<void> _updateTextColor() async {
    setState(() => _saving = true);

    await ref.read(profileProvider.notifier).updateColor(color!).then((_) {
      context.pop();
    });

    setState(() => _saving = false);
  }

  @override
  Widget build(BuildContext context) {
    return SystemActionPage(
        body: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SystemText(
                  color: color != null
                      ? color!.adjusted(ref.watch(resolvedBrightnessProvider))
                      : widget.profile.color,
                  text: AppLocalizations.of(context)!
                      .settings_customization_nav_text_color_title,
                  size: TextSizeEnum.eighteen),
              const SizedBox(
                height: spacingFour,
              ),
              SystemText(
                  align: TextAlign.start,
                  text:
                      AppLocalizations.of(context)!.settings_color_explanation,
                  size: TextSizeEnum.fifteen,
                  color: color != null
                      ? color!.adjusted(ref.watch(resolvedBrightnessProvider))
                      : widget.profile.color),
              const SizedBox(
                height: spacingFour,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.width,
                  child: Padding(
                      padding: const EdgeInsets.all(spacingFive),
                      child: ColorWheelPicker(
                        wheelSquareBorderRadius: inputRadius,
                        wheelSquarePadding: spacingSix,
                        wheelWidth: spacingSix,
                        onWheel: (value) {},
                        color: color != null
                            ? color!
                                .adjusted(ref.watch(resolvedBrightnessProvider))
                            : widget.profile.color,
                        onChanged: (value) {
                          setState(() {
                            color = value;
                          });
                        },
                      )))
            ]),
        action: SaveButton(
            saving: _saving,
            enabled: color != null && color != widget.profile.color,
            onPressed: _updateTextColor));
  }
}
