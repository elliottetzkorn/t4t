import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/providers/filters/filters_provider.dart';

part 'filter_words_selection_provider.g.dart';

@riverpod
class FilterWordsSelection extends _$FilterWordsSelection {
  @override
  List<String> build() {
    return ref.read(filtersProvider.select((selector) => selector.words));
  }

  void changeWords(String? words) {
    if (words == null) {
      state = [];
    } else {
      state = words
          .split(RegExp(r'\W+')) // Split by any non-word character except @
          .where((e) => e.isNotEmpty) // Remove empty strings
          .map((e) => e.toLowerCase()) // Convert each word to lowercase
          .toList();
    }
  }
}
