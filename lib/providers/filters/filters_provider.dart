import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/filters_data.dart';
import 'package:t4t/providers/filters/filters_badges_selection_provider.dart';
import 'package:t4t/providers/filters/filters_distance_selection_provider.dart';
import 'package:t4t/providers/filters/filters_max_age_selection_provider.dart';
import 'package:t4t/providers/filters/filters_min_age_selection_provider.dart';
import 'package:t4t/providers/filters/filters_post_type_selection_provider.dart';
import 'package:t4t/providers/filters/filter_words_selection_provider.dart';

part 'filters_provider.g.dart';

@riverpod
class Filters extends _$Filters {
  @override
  FiltersData build() {
    List<String>? badgesStringList = prefs.getStringList(prefsFilterBadges);

    List<String> words;

    try {
      words = prefs.getStringList(prefsFilterWords) ?? [];
    } catch (e) {
      words = [];
    }

    return FiltersData(
        distance: prefs.getInt(prefsFilterDistance) ?? maxDistanceKey,
        badges: badgesStringList == null
            ? []
            : badgesStringList.map((e) => int.parse(e)).toList(),
        type: prefs.getInt(prefsFilterType) ?? postTypes.first,
        minAge: prefs.getInt(prefsFilterMinAge) ?? appMinAge,
        maxAge: prefs.getInt(prefsFilterMaxAge) ?? appMaxAge,
        words: words);
  }

  void reset() {
    prefs.setInt(prefsFilterType, postTypes.first);
    prefs.setInt(prefsFilterDistance, maxDistanceKey);
    prefs.setStringList(prefsFilterBadges, []);
    prefs.setInt(prefsFilterMinAge, appMinAge);
    prefs.setInt(prefsFilterMaxAge, appMaxAge);
    prefs.setString(prefsFilterWords, '');

    state = state.copyWith(
        badges: [],
        distance: maxDistanceKey,
        type: postTypes.first,
        minAge: appMinAge,
        maxAge: appMaxAge,
        words: []);
  }

  void updateFilters() {
    final newBadges = ref.read(filtersBadgesSelectionProvider);
    final minAge = ref.read(filtersMinAgeSelectionProvider);
    final maxAge = ref.read(filtersMaxAgeSelectionProvider);
    final type = ref.read(filtersPostTypeSelectionProvider);
    final distance = ref.read(filtersDistanceSelectionProvider);
    final words = ref.read(filterWordsSelectionProvider);

    prefs.setInt(prefsFilterType, type);
    prefs.setInt(prefsFilterDistance, distance);
    prefs.setStringList(
        prefsFilterBadges, newBadges.map((e) => e.toString()).toList());
    prefs.setInt(prefsFilterMinAge, minAge);
    prefs.setInt(prefsFilterMaxAge, maxAge);
    prefs.setStringList(prefsFilterWords, words);

    state = state.copyWith(
        badges: newBadges,
        minAge: minAge,
        maxAge: maxAge,
        type: type,
        distance: distance,
        words: words);
  }
}
