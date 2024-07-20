import 'package:flutter/material.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/design_system/system_text_field.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/constants.dart';

class LimitedLengthTextFormField extends StatefulWidget {
  const LimitedLengthTextFormField(
      {super.key,
      required this.title,
      this.subtitle,
      this.text,
      this.highContrast = false,
      this.lines = 1,
      required this.maxChars,
      required this.handleCaptionChanged,
      this.onSubmitted,
      this.autoFocus = false,
      this.continueAction = TextInputAction.done,
      this.hint,
      this.extraFocusedEmphasis = false,
      this.capitalization = TextCapitalization.sentences});

  final String title;
  final String? subtitle;
  final String? text;
  final int maxChars;
  final bool highContrast;
  final int lines;
  final Function(String?, bool, bool) handleCaptionChanged;
  final TextInputAction continueAction;
  final Function(String)? onSubmitted;
  final bool autoFocus;
  final String? hint;
  final TextCapitalization capitalization;
  final bool extraFocusedEmphasis;

  @override
  State<LimitedLengthTextFormField> createState() =>
      _LimitedLengthTextFormFieldState();
}

class _LimitedLengthTextFormFieldState
    extends State<LimitedLengthTextFormField> {
  final _captionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.text != null) {
      _captionController.text = widget.text!;
    }
  }

  @override
  void dispose() {
    _captionController.dispose();

    super.dispose();
  }

  int charsLeft() {
    return widget.maxChars - _captionController.text.length;
  }

  bool captionShortEnough() {
    return _captionController.text.length <= widget.maxChars &&
        _captionController.text.isNotEmpty;
  }

  bool captionUnique() {
    if (widget.text == null) {
      return _captionController.text.isNotEmpty;
    } else {
      return _captionController.text != widget.text;
    }
  }

  bool captionRequiresSaving() {
    return captionShortEnough() && captionUnique();
  }

  void handleCaptionChanged(String? text) {
    widget.handleCaptionChanged(text, captionUnique(), captionShortEnough());
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child:
                    SystemText(text: widget.title, size: TextSizeEnum.eighteen),
              ),
              const SizedBox(
                width: spacingFive,
              ),
              if (charsLeft() < 3)
                SystemText(
                    text:
                        '${_captionController.text.length}/${widget.maxChars}',
                    size: TextSizeEnum.twelve,
                    color: captionShortEnough()
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.red),
            ],
          )
        ],
      ),
      const SizedBox(height: spacingFive),
      SystemTextField(
        extraFocusedEmphasis: widget.extraFocusedEmphasis,
        text: widget.text,
        hint: widget.hint,
        capitalization: widget.capitalization,
        autoFocus: widget.autoFocus,
        maxLines: widget.lines,
        onSubmitted: widget.onSubmitted,
        onChanged: handleCaptionChanged,
        highContrast: widget.highContrast,
        textInputAction: widget.continueAction,
        keyboardType: widget.continueAction == TextInputAction.newline
            ? TextInputType.multiline
            : TextInputType.text,
        textEditingController: _captionController,
      )
    ]);
  }
}
