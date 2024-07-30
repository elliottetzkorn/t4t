import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/extensions/font_scale_extensions.dart';
import 'package:t4t/extensions/text_size_extensions.dart';
import 'package:t4t/providers/font_scale_provider.dart';
import 'package:t4t/providers/simple_font_provider.dart';

class SystemTextField extends ConsumerWidget {
  const SystemTextField(
      {super.key,
      this.text,
      this.highContrast = false,
      this.onChanged,
      this.onSubmitted,
      this.textEditingController,
      this.primaryColor,
      this.secondaryColor,
      this.textInputAction = TextInputAction.done,
      this.suffixIcon,
      this.onSuffixTapped,
      this.maxLines,
      this.autoFocus = false,
      this.hint,
      this.enabled = true,
      this.extraFocusedEmphasis = false,
      this.capitalization = TextCapitalization.sentences,
      this.keyboardType = TextInputType.text,
      this.editingAction});

  final bool enabled;
  final String? text;
  final bool highContrast;
  final Function(String?)? onChanged;
  final Function(String)? onSubmitted;
  final TextEditingController? textEditingController;
  final TextInputAction textInputAction;
  final Color? primaryColor;
  final Color? secondaryColor;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTapped;
  final int? maxLines;
  final bool autoFocus;
  final String? hint;
  final TextCapitalization capitalization;
  final bool extraFocusedEmphasis;
  final TextInputType keyboardType;
  final VoidCallback? editingAction;

  Color foreground(BuildContext context) {
    return primaryColor != null
        ? primaryColor!
        : Theme.of(context).colorScheme.primary;
  }

  Color background(BuildContext context) {
    return secondaryColor != null
        ? secondaryColor!
        : highContrast
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).colorScheme.surface;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fontScale = ref.watch(fontScaleProvider);

    return TextField(
        keyboardType: keyboardType,
        enabled: enabled,
        autofocus: autoFocus,
        textCapitalization: capitalization,
        textInputAction: textInputAction,
        controller: textEditingController,
        onEditingComplete: editingAction,
        style: TextStyle(
            fontFamily:
                ref.watch(simpleFontProvider) ? fontSimple : fontWaxWing,
            color: foreground(context),
            fontSize:
                TextSizeEnum.fifteen.toFontSize() * fontScale.toMultiple()),
        decoration: InputDecoration(
            suffixIcon: suffixIcon == null
                ? null
                : IconButton(
                    icon: Icon(suffixIcon!),
                    onPressed: () => onSuffixTapped!()),
            suffixIconColor: foreground(context),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: thinLine,
                  color: extraFocusedEmphasis
                      ? background(context)
                      : foreground(context)),
              borderRadius: BorderRadius.circular(inputRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(inputRadius),
              borderSide: BorderSide(width: line, color: foreground(context)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(inputRadius),
              borderSide: BorderSide(
                  width: 1, color: Theme.of(context).colorScheme.error),
            ),
            hintStyle: TextStyle(
                color: primaryColor ?? Theme.of(context).colorScheme.secondary),
            fillColor: background(context),
            hintText:
                hint ?? AppLocalizations.of(context)!.t4t_text_field_hint),
        cursorColor: foreground(context),
        onChanged: (value) =>
            onChanged == null ? null : onChanged!(value.trim()),
        onSubmitted: (value) =>
            onSubmitted == null ? null : onSubmitted!(value.trim()),
        maxLines: maxLines);
  }
}
