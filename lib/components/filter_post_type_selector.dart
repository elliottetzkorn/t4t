import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/post_type_selector.dart';
import 'package:t4t/providers/filters/filters_post_type_selection_provider.dart';

class FilterPostTypeSelector extends ConsumerWidget {
  const FilterPostTypeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCell = ref.watch(filtersPostTypeSelectionProvider);

    return PostTypeSelector(
        onTapped: (int tappedId) {
          ref
              .read(filtersPostTypeSelectionProvider.notifier)
              .changeType(tappedId);
        },
        currentCell: currentCell);
  }
}
