import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/providers/filters/filters_provider.dart';

part 'filters_badges_selection_provider.g.dart';

@riverpod
class FiltersBadgesSelection extends _$FiltersBadgesSelection {
  @override
  List<int> build() {
    return ref.read(filtersProvider.select((selector) => selector.badges));
  }

  void toggleBadge(int id) {
    List<int> newBadges = List.empty(growable: true);
    newBadges.addAll(state);

    if (newBadges.contains(id)) {
      newBadges.remove(id);
      state = newBadges;
    } else {
      newBadges.add(id);
      state = newBadges;
    }
  }
}
