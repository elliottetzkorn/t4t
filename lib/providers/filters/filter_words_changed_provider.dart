import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/providers/filters/filters_provider.dart';
import 'package:t4t/providers/filters/filter_words_selection_provider.dart';

part 'filter_words_changed_provider.g.dart';

@riverpod
bool filterWordsChanged(FilterWordsChangedRef ref) {
  return ref.watch(filtersProvider.select((selector) => selector.words)) !=
      ref.watch(filterWordsSelectionProvider);
}
