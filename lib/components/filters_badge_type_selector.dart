import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/badge_type_selector.dart';
import 'package:t4t/data/badge_data.dart';
import 'package:t4t/providers/filters/filters_badges_selection_provider.dart';

class FiltersBadgeTypeSelector extends ConsumerWidget {
  const FiltersBadgeTypeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBadges = ref.watch(filtersBadgesSelectionProvider);

    return BadgeTypeSelector(
        onTapped: (BadgeData badge) {
          ref
              .read(filtersBadgesSelectionProvider.notifier)
              .toggleBadge(badge.id);
        },
        currentBadges: currentBadges);
  }
}
