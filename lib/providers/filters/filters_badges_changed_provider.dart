import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/providers/filters/filters_badges_selection_provider.dart';
import 'package:t4t/providers/filters/filters_provider.dart';

part 'filters_badges_changed_provider.g.dart';

@riverpod
bool filtersBadgesChanged(FiltersBadgesChangedRef ref) {
  final oldBadges =
      ref.watch(filtersProvider.select((selector) => selector.badges));

  final newBadges = ref.watch(filtersBadgesSelectionProvider);

  // Check if the lengths of the lists are different
  if (oldBadges.length != newBadges.length) {
    return true;
  }

  // Check if all elements in newBadges are in oldBadges and vice versa
  final Set<int> oldBadgesSet = Set.from(oldBadges);
  final Set<int> newBadgesSet = Set.from(newBadges);

  return oldBadgesSet.difference(newBadgesSet).isNotEmpty ||
      newBadgesSet.difference(oldBadgesSet).isNotEmpty;
}
