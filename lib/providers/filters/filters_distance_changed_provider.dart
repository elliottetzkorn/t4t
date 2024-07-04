import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/providers/filters/filters_distance_selection_provider.dart';
import 'package:t4t/providers/filters/filters_provider.dart';

part 'filter_distance_changed_provider.g.dart';

@riverpod
bool filterDistanceChanged(FilterDistanceChangedRef ref) {
  return ref.watch(filtersProvider.select((selector) => selector.distance)) !=
      ref.watch(filtersDistanceSelectionProvider);
}
