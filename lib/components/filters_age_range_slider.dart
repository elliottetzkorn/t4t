import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/providers/filters/filters_max_age_selection_provider.dart';
import 'package:t4t/providers/filters/filters_min_age_selection_provider.dart';

class FiltersAgeRangeSlider extends ConsumerWidget {
  const FiltersAgeRangeSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final minAge = ref.watch(filtersMinAgeSelectionProvider);
    final maxAge = ref.watch(filtersMaxAgeSelectionProvider);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SystemText(text: minAge.toString()),
            SystemText(
                text: maxAge == appMaxAge ? '$maxAge+' : maxAge.toString())
          ],
        ),
        RangeSlider(
          inactiveColor: Theme.of(context).colorScheme.tertiary,
          min: appMinAge.toDouble(),
          max: appMaxAge.toDouble(),
          values: RangeValues(minAge.toDouble(), maxAge.toDouble()),
          onChanged: (value) {
            ref
                .read(filtersMinAgeSelectionProvider.notifier)
                .changeAge(value.start.toInt());
            ref
                .read(filtersMaxAgeSelectionProvider.notifier)
                .changeAge(value.end.toInt());
          },
        )
      ],
    );
  }
}
