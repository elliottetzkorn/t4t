import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:t4t/components/distance_selector.dart';
import 'package:t4t/components/filter_post_type_selector.dart';
import 'package:t4t/components/filters_age_range_slider.dart';
import 'package:t4t/components/filters_badge_type_selector.dart';
import 'package:t4t/components/filters_search_button.dart';
import 'package:t4t/components/title_subtitle.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/design_system/system_action_page.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/providers/filters/filters_provider.dart';

class SettingsFiltersPage extends ConsumerWidget {
  const SettingsFiltersPage({super.key, required this.authenticated});

  final bool authenticated;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SystemActionPage(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SystemText(
                  text: AppLocalizations.of(context)!.posts_types_title,
                  size: TextSizeEnum.eighteen),
              const SizedBox(
                height: spacingFive,
              ),
              const FilterPostTypeSelector(),
              const SizedBox(
                height: spacingSix,
              ),
              if (authenticated) const DistanceSelector(),
              const SizedBox(
                height: spacingFive,
              ),
              SystemText(
                  text: AppLocalizations.of(context)!.posts_age_range_title,
                  size: TextSizeEnum.eighteen),
              const SizedBox(
                height: spacingFour,
              ),
              const FiltersAgeRangeSlider(),
              const SizedBox(
                height: spacingSix,
              ),
              TitleSubtitle(
                  title: AppLocalizations.of(context)!.setup_badges_title,
                  subTitle:
                      AppLocalizations.of(context)!.posts_filters_subtitle),
              const SizedBox(
                height: spacingFive,
              ),
              const FiltersBadgeTypeSelector(),
            ]),
        action: FiltersSearchButton(
            onPressed: () => {
                  ref.read(filtersProvider.notifier).updateFilters(),
                  context.pop()
                }));
  }
}
