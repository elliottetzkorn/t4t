import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:t4t/components/post_like_sheet.dart';
import 'package:t4t/components/post_min_cell.dart';
import 'package:t4t/components/post_reactions.dart';
import 'package:t4t/components/profile_sheet.dart';
import 'package:t4t/components/system_tap.dart';
import 'package:t4t/components/username_flair.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/like_min_data.dart';
import 'package:t4t/data/post_data.dart';
import 'package:t4t/data/post_min_data.dart';
import 'package:t4t/data/profile_min_data.dart';
import 'package:t4t/design_system/system_button.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/extensions/strings_extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';
import 'package:t4t/providers/resolved_brightness_provider.dart';
import 'package:t4t/providers/simple_font_provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PostCell extends ConsumerWidget {
  const PostCell(
      {super.key,
      required this.post,
      required this.like,
      required this.profile,
      this.likeCount,
      this.onSheet = false,
      this.showUsername = true,
      required this.authenticated});

  final PostData post;
  final LikeMinData? like;
  final ProfileMinData profile;
  final int? likeCount;
  final bool onSheet;
  final bool showUsername;
  final bool authenticated;

  void addToCalendar(Event event) {
    Add2Calendar.addEvent2Cal(event);
  }

  bool shouldGoToLikeSheet() {
    return profile.id.isOwnId() && likeCount != null && likeCount! > 0;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (post.event != null && post.lat != null && post.lon != null)
              Column(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(feedRadius),
                          topRight: Radius.circular(feedRadius)),
                      child: SizedBox(
                        height: spacingTen,
                        child: Stack(children: [
                          IgnorePointer(
                              child: FlutterMap(
                                  options: MapOptions(
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    interactionOptions:
                                        const InteractionOptions(
                                            flags: InteractiveFlag.none),
                                    initialCenter: LatLng(post.lat!, post.lon!),
                                    initialZoom: initialZoom,
                                    keepAlive: true,
                                  ),
                                  children: [
                                ColorFiltered(
                                    colorFilter: ColorFilter.matrix(
                                        ref.watch(resolvedBrightnessProvider) ==
                                                Brightness.dark
                                            ? [
                                                -1,
                                                0,
                                                0,
                                                0,
                                                165,
                                                0,
                                                -1,
                                                0,
                                                0,
                                                255,
                                                0,
                                                0,
                                                -1,
                                                0,
                                                255,
                                                0,
                                                0,
                                                0,
                                                1,
                                                0,
                                              ]
                                            : [
                                                1,
                                                0,
                                                0,
                                                0,
                                                0,
                                                0,
                                                1,
                                                0,
                                                0,
                                                0,
                                                0,
                                                0,
                                                1,
                                                0,
                                                0,
                                                0,
                                                0,
                                                0,
                                                1,
                                                0,
                                              ]),
                                    child: TileLayer(
                                        panBuffer: 0,
                                        urlTemplate:
                                            'https://tiles.stadiamaps.com/tiles/stamen_watercolor/{z}/{x}/{y}.jpg?api_key=${dotenv.env['STAMEN_KEY']!}',
                                        tileProvider:
                                            const FMTCStore(cacheWatercolor)
                                                .getTileProvider(),
                                        retinaMode: MediaQuery.of(context)
                                                .devicePixelRatio >
                                            1.0,
                                        userAgentPackageName: 'com.t4t.app')),
                              ])),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: double.infinity,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor
                                        .withOpacity(
                                            MediaQuery.platformBrightnessOf(
                                                        context) ==
                                                    Brightness.light
                                                ? 0.8
                                                : 0.5),
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.symmetric(
                                                vertical: spacingFour,
                                                horizontal: spacingSix),
                                        child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: ref
                                                            .watch(
                                                                simpleFontProvider)
                                                        ? fontSimple
                                                        : fontWaxWing,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                    height: lineHeight,
                                                    fontSize: 13),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                        '${AppLocalizations.of(context)!.where}: ',
                                                  ),
                                                  TextSpan(
                                                      text: post.event!.location
                                                          ?.replaceAll(
                                                              ', USA', ''),
                                                      style: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                      )),
                                                  TextSpan(
                                                    text:
                                                        '\n${AppLocalizations.of(context)!.when}: ',
                                                  ),
                                                  TextSpan(
                                                      text: DateFormat(
                                                              locationFormatting)
                                                          .format(post.event!
                                                              .startDate),
                                                      style: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                      )),
                                                ])))),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: spacingFour),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SystemButton(
                                            text: AppLocalizations.of(context)!
                                                .open_map,
                                            onPressed: () {
                                              MapLauncher.installedMaps
                                                  .then((value) {
                                                value.first.showMarker(
                                                  coords: Coords(
                                                      post.lat!, post.lon!),
                                                  title: post.event!.title,
                                                );
                                              });
                                            }),
                                        const SizedBox(
                                          width: spacingFive,
                                        ),
                                        SystemButton(
                                            text: AppLocalizations.of(context)!
                                                .save_event,
                                            onPressed: () =>
                                                addToCalendar(post.event!)),
                                      ],
                                    )),
                              ])
                        ]),
                      )),
                  const SizedBox(
                    height: spacingFour,
                  ),
                ],
              ),
            SystemTap(
                onTap: shouldGoToLikeSheet()
                    ? () => PostLikeSheet().show(context, post.id)
                    : onSheet
                        ? null
                        : () => ProfileSheet().show(context, profile, false,
                            authenticated, () {}, null),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (showUsername)
                            Expanded(
                                child: UsernameFlair(
                              profile: profile,
                            )),
                          SystemText(
                            text: timeago.format(post.createdAt,
                                clock: DateTime.now().toUtc()),
                            size: TextSizeEnum.twelve,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: spacingThree,
                      ),
                      PostMinCell(
                        post: PostMinData(title: post.title, body: post.body),
                      ),
                      const SizedBox(
                        height: spacingFour,
                      ),
                      PostReactions(
                          authenticated: authenticated,
                          likeCount: likeCount ?? 0,
                          profile: profile,
                          post: post,
                          like: like)
                    ])),
          ],
        ),
      ],
    );
  }
}
