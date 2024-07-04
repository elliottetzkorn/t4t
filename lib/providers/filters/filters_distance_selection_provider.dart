import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/providers/filters/filters_provider.dart';

part 'filters_distance_selection_provider.g.dart';

@riverpod
class FiltersDistanceSelection extends _$FiltersDistanceSelection {
  @override
  int build() {
    return ref.read(filtersProvider.select((selector) => selector.distance));
  }

  void change(int distance) {
    state = distance;
  }
}
