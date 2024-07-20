import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/empty_page.dart';
import 'package:t4t/components/header.dart';
import 'package:t4t/components/post_cell.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/filters_data.dart';
import 'package:t4t/design_system/system_button.dart';
import 'package:t4t/design_system/system_divider.dart';
import 'package:t4t/design_system/system_error.dart';
import 'package:t4t/design_system/system_loader.dart';
import 'package:t4t/design_system/system_sheet.dart';
import 'package:t4t/design_system/system_text_button.dart';
import 'package:t4t/extensions/color_extensions.dart';
import 'package:t4t/extensions/filters_data_extensions.dart';
import 'package:t4t/extensions/int_extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/pages/settings/filters_page.dart';
import 'package:t4t/providers/filters/filters_provider.dart';
import 'package:t4t/providers/posts_authenticated_provider.dart';
import 'package:t4t/providers/posts_unauthenticated_provider.dart';
import 'package:t4t/providers/resolved_brightness_provider.dart';
import 'package:t4t/providers/simple_font_provider.dart';

class PostsPage extends ConsumerWidget {
  const PostsPage(
      {super.key, required this.scrollController, required this.authenticated});

  final ScrollController scrollController;
  final bool authenticated;

  RichText buildFiltersText(
      BuildContext context, WidgetRef ref, FiltersData filters) {
    return RichText(
        text: TextSpan(
            style: TextStyle(
                fontFamily:
                    ref.watch(simpleFontProvider) ? fontSimple : fontWaxWing,
                color: Theme.of(context).colorScheme.tertiary,
                height: lineHeight,
                fontSize: 15),
            children: <TextSpan>[
          if (filters.words.isNotEmpty)
            TextSpan(
              text: AppLocalizations.of(context)!.containing,
            ),
          if (filters.words.isNotEmpty)
            TextSpan(
              text: "${filters.words.map((word) => "'$word'").join(', ')} ",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          TextSpan(
            text: AppLocalizations.of(context)!.from,
          ),
          for (int i = 0; i < filters.badges.length; i++)
            TextSpan(
              children: [
                TextSpan(
                    text: availableBadges
                        .firstWhere(
                            (element) => element.id == filters.badges[i])
                        .text,
                    style: TextStyle(
                        color: availableBadges
                            .firstWhere(
                                (element) => element.id == filters.badges[i])
                            .color
                            .adjusted(ref.watch(resolvedBrightnessProvider)))),
                TextSpan(
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    text: i == filters.badges.length - 1 ? ' ' : ', '),
              ],
            ),
          filters.badges.isEmpty
              ? TextSpan(
                  text: AppLocalizations.of(context)!.everyone_simple,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary))
              : TextSpan(
                  text: AppLocalizations.of(context)!.users,
                ),
          if (filters.distance != maxDistanceKey &&
              filters.distance != minDistanceKey)
            TextSpan(
              text: AppLocalizations.of(context)!.within,
            ),
          TextSpan(
              text: valueToDistance[filters.distance] == maxDistanceValue
                  ? AppLocalizations.of(context)!.everywhere_small
                  : valueToDistance[filters.distance] == minDistanceValue
                      ? AppLocalizations.of(context)!.nearby
                      : AppLocalizations.of(context)!
                          .within_range(valueToDistance[filters.distance]!),
              style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          if (filters.minAge == appMinAge && filters.maxAge == appMaxAge)
            TextSpan(
              text: AppLocalizations.of(context)!.of2,
            ),
          if (filters.minAge == appMinAge && filters.maxAge == appMaxAge)
            TextSpan(
                text: AppLocalizations.of(context)!.all_ages,
                style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          if (filters.minAge != appMinAge || filters.maxAge != appMaxAge)
            TextSpan(
              text: AppLocalizations.of(context)!.between,
            ),
          if (filters.minAge != appMinAge || filters.maxAge != appMaxAge)
            TextSpan(
                text: filters.minAge.toString(),
                style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          if (filters.minAge != appMinAge || filters.maxAge != appMaxAge)
            TextSpan(
              text: AppLocalizations.of(context)!.and,
            ),
          if (filters.minAge != appMinAge || filters.maxAge != appMaxAge)
            TextSpan(
                text: filters.maxAge == appMaxAge
                    ? '${filters.maxAge}+'
                    : filters.maxAge.toString(),
                style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          const TextSpan(
            text: ':',
          ),
        ]));
  }

  Widget postsHeader(BuildContext context, WidgetRef ref) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Header(
        title: ref
            .read(filtersProvider.select((it) => it.type))
            .toPostTypePlural(context),
      ),
      Padding(
          padding: const EdgeInsets.all(spacingFive),
          child: buildFiltersText(context, ref, ref.read(filtersProvider))),
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        if (!ref.read(filtersProvider).isDefault())
          SystemTextButton(
            text: AppLocalizations.of(context)!.reset,
            onPressed: () => ref.read(filtersProvider.notifier).reset(),
          ),
        const SizedBox(
          width: spacingFive,
        ),
        SystemButton(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          backgroundColorTapped: Theme.of(context).colorScheme.tertiary,
          text: AppLocalizations.of(context)!.search_button_search,
          onPressed: () => SystemSheet.show(
              context: context,
              child: SettingsFiltersPage(
                authenticated: authenticated,
              )),
        ),
        const SizedBox(
          width: spacingFive,
        ),
      ]),
      const Padding(
          padding: EdgeInsets.all(spacingFive), child: SystemDivider()),
    ]);
  }

  Future<void> _pullRefresh(BuildContext context, WidgetRef ref) async {
    HapticFeedback.selectionClick();

    authenticated
        ? ref.read(postsAuthenticatedProvider.notifier).poll(true)
        : ref.read(postsUnauthenticatedProvider.notifier).poll();

    HapticFeedback.lightImpact();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = authenticated
        ? ref.watch(postsAuthenticatedProvider)
        : ref.watch(postsUnauthenticatedProvider);

    return Center(
      child: switch (posts) {
        AsyncData(value: final postsValue) => postsValue.isEmpty
            ? EmptyPage(
                header: postsHeader(context, ref),
                title: AppLocalizations.of(context)!.no_post_filters,
                image: const AssetImage('images/bunnies1.png'))
            : RefreshIndicator(
                strokeWidth: thinLine,
                displacement: spacingSeven,
                onRefresh: () => _pullRefresh(context, ref),
                child: ListView.separated(
                  controller: scrollController,
                  itemCount: postsValue.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: spacingSix,
                  ),
                  padding: const EdgeInsets.only(bottom: spacingSeven),
                  itemBuilder: (context, i) {
                    return Builder(builder: (context) {
                      final post = postsValue[i];

                      if (i == postsValue.length - 1 &&
                          postsValue.length % fetchQty == 0) {
                        authenticated
                            ? ref
                                .read(postsAuthenticatedProvider.notifier)
                                .scroll()
                            : ref
                                .read(postsUnauthenticatedProvider.notifier)
                                .scroll();
                      }

                      return Column(children: [
                        if (i == 0) postsHeader(context, ref),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: spacingFive,
                                left: spacingFive,
                                right: spacingFive),
                            child: PostCell(
                              showMatches: true,
                              authenticated: authenticated,
                              post: post.post,
                              like: post.like,
                              profile: post.profile,
                              likeCount: post.likeCount,
                            )),
                        if (i == postsValue.length - 1 &&
                            postsValue.length % fetchQty == 0)
                          const SystemLoader()
                      ]);
                    });
                  },
                ),
              ),
        AsyncError() => Column(children: [
            postsHeader(context, ref),
            SystemError(
                onPressed: () => authenticated
                    ? ref.invalidate(postsAuthenticatedProvider)
                    : ref.invalidate(postsUnauthenticatedProvider))
          ]),
        _ => Column(children: [
            postsHeader(context, ref),
            const Expanded(child: SystemLoader())
          ]),
      },
    );
  }
}
