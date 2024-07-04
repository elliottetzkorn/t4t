import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/providers/filters/filters_provider.dart';
import 'package:t4t/providers/filters/filters_min_age_selection_provider.dart';

part 'filters_min_age_changed_provider.g.dart';

@riverpod
bool filtersMinAgeChanged(FiltersMinAgeChangedRef ref) {
  return ref.watch(filtersProvider.select((selector) => selector.minAge)) !=
      ref.watch(filtersMinAgeSelectionProvider);
}
