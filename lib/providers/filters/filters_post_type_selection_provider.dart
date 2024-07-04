import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/providers/filters/filters_provider.dart';

part 'filters_post_type_selection_provider.g.dart';

@riverpod
class FiltersPostTypeSelection extends _$FiltersPostTypeSelection {
  @override
  int build() {
    return ref.read(filtersProvider.select((selector) => selector.type));
  }

  void changeType(int type) {
    state = type;
  }
}
