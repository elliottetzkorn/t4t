import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/providers/filters/filters_provider.dart';

part 'filters_min_age_selection_provider.g.dart';

@riverpod
class FiltersMinAgeSelection extends _$FiltersMinAgeSelection {
  @override
  int build() {
    return ref.read(filtersProvider.select((selector) => selector.minAge));
  }

  void changeAge(int age) {
    state = age;
  }
}
