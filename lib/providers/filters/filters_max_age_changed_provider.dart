import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/providers/filters/filters_provider.dart';
import 'package:t4t/providers/filters/filters_max_age_selection_provider.dart';

part 'filter_max_age_changed_provider.g.dart';

@riverpod
bool filterMaxAgeChanged(FilterMaxAgeChangedRef ref) {
  return ref.watch(filtersProvider.select((selector) => selector.maxAge)) !=
      ref.watch(filtersMaxAgeSelectionProvider);
}
