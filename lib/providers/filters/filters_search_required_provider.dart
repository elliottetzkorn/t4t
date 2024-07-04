import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/providers/filters/filters_badges_changed_provider.dart';
import 'package:t4t/providers/filters/filters_distance_changed_provider.dart';
import 'package:t4t/providers/filters/filters_max_age_changed_provider.dart';
import 'package:t4t/providers/filters/filters_min_age_changed_provider.dart';
import 'package:t4t/providers/filters/filters_post_type_changed_provider.dart';

part 'filters_search_required_provider.g.dart';

@riverpod
bool filtersSearchRequired(FiltersSearchRequiredRef ref) {
  return ref.watch(filtersBadgesChangedProvider) ||
      ref.watch(filtersMinAgeChangedProvider) ||
      ref.watch(filterMaxAgeChangedProvider) ||
      ref.watch(filtersPostTypeChangedProvider) ||
      ref.watch(filterDistanceChangedProvider);
}
