import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/limited_length_text_form_field.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/providers/filters/filter_words_selection_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FiltersWordInput extends ConsumerWidget {
  const FiltersWordInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWords = ref.watch(filterWordsSelectionProvider);

    return LimitedLengthTextFormField(
        title: AppLocalizations.of(context)!.posts_words_title,
        highContrast: true,
        text: currentWords.join(', '),
        maxChars: titleLength,
        handleCaptionChanged: (p0, p1, p2) =>
            ref.read(filterWordsSelectionProvider.notifier).changeWords(p0));
  }
}
