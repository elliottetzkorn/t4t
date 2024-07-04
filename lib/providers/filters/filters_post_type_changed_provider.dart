import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/providers/filters/filters_provider.dart';
import 'package:t4t/providers/filters/filters_post_type_selection_provider.dart';

part 'filters_post_type_changed_provider.g.dart';

@riverpod
bool filtersPostTypeChanged(FiltersPostTypeChangedRef ref) {
  return ref.watch(filtersProvider.select((selector) => selector.type)) !=
      ref.watch(filtersPostTypeSelectionProvider);
}
