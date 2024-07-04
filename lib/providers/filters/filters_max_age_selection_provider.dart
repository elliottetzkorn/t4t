import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/providers/filters/filters_provider.dart';

part 'filters_max_age_selection_provider.g.dart';

@riverpod
class FiltersMaxAgeSelection extends _$FiltersMaxAgeSelection {
  @override
  int build() {
    return ref.read(filtersProvider.select((selector) => selector.maxAge));
  }

  void changeAge(int age) {
    state = age;
  }
}
