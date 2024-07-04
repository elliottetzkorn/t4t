import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/components/profile_header_details.dart';
import 'package:t4t/components/profile_header_min.dart';
import 'package:t4t/components/profile_sheet_posts.dart';
import 'package:t4t/components/user_posts.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/data/profile_min_data.dart';
import 'package:t4t/design_system/system_dialog.dart';
import 'package:t4t/design_system/system_divider.dart';
import 'package:t4t/design_system/system_error.dart';
import 'package:t4t/design_system/system_loader.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/design_system/system_text_button.dart';
import 'package:t4t/extensions/color_extensions.dart';
import 'package:t4t/pages/messages/messages_page.dart';
import 'package:t4t/providers/conversations_provider.dart';
import 'package:t4t/providers/notifications_provider.dart';
import 'package:t4t/providers/posts_authenticated_provider.dart';
import 'package:t4t/providers/profile_posts_provider.dart';
import 'package:t4t/providers/profile_sheet_posts_provider.dart';
import 'package:t4t/providers/profile_sheet_profile_provider.dart';
import 'package:t4t/providers/resolved_brightness_provider.dart';
import 'package:t4t/providers/router_provider.dart';
import 'package:t4t/repositories/profile_sheet_profile_repository.dart';
import 'package:t4t/utils/location_utils.dart';

class ProfileSheetPage extends ConsumerWidget {
  const ProfileSheetPage(
      {super.key,
      required this.profile,
      this.fullProfile,
      this.inChat = false,
      this.replyPressed,
      required this.authenticated});

  final ProfileMinData profile;
  final ProfileData? fullProfile;
  final bool inChat;
  final VoidCallback? replyPressed;
  final bool authenticated;

  String distance(ProfileData detailedProfile) {
    if (detailedProfile.city == null || detailedProfile.country == null) {
      return '';
    } else {
      return ', ${LocationUtils.formatted(detailedProfile.neighborhood, detailedProfile.city!, detailedProfile.state, detailedProfile.country!)}';
    }
  }

  Future<void> checkIfBlock(
      BuildContext context, String profileId, WidgetRef ref) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SystemDialog(
          subTitle: AppLocalizations.of(context)!.block_user_body,
          children: <Widget>[
            SystemTextButton(
              text: AppLocalizations.of(context)!.no,
              profile: null,
              onPressed: () => context.pop(),
            ),
            SystemTextButton(
              text: AppLocalizations.of(context)!.yes,
              profile: null,
              onPressed: () {
                blockUser(context, profileId, ref);
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> checkIfBan(BuildContext context, String profileId) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SystemDialog(
          subTitle: AppLocalizations.of(context)!.ban_user_body,
          children: <Widget>[
            SystemTextButton(
              text: AppLocalizations.of(context)!.no,
              profile: null,
              onPressed: () => context.pop(),
            ),
            SystemTextButton(
              text: AppLocalizations.of(context)!.yes,
              profile: null,
              onPressed: () {
                reportUser(context, profileId);
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> confirmReport(BuildContext context) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SystemDialog(
            subTitle: AppLocalizations.of(context)!.report_dialog,
            children: const [],
          );
        });
  }

  Future<void> reportUser(BuildContext context, String profileId) async {
    await ProfileSheetProfileRepository.reportUser(profileId).then((value) {
      confirmReport(context);
    });
  }

  Future<void> blockUser(
      BuildContext context, String profileId, WidgetRef ref) async {
    await ProfileSheetProfileRepository.blockUser(profileId).then((value) {
      removeBlockedUser(ref, profileId);
      context.pop();
      if (inChat) {
        context.pop();
      }
    });
  }

  void removeBlockedUser(WidgetRef ref, String profileId) {
    ref.read(conversationsProvider.notifier).removeBlockedUser(profileId);
    ref.read(notificationsProvider.notifier).removeBlockedUser(profileId);
    ref.read(postsAuthenticatedProvider.notifier).removeBlockedUser(profileId);
  }

  String raceString(ProfileData detailedProfile) {
    if (detailedProfile.race == null || detailedProfile.race!.isEmpty) {
      return '';
    } else {
      return '${detailedProfile.race!.toLowerCase()}, ';
    }
  }

  void goToConversation(WidgetRef ref) {
    if (inChat) {
      ref.read(routerProvider).pop();
    } else {
      ref
          .read(routerProvider)
          .pushNamed(routemMssages, extra: MessagePageData(profile: profile));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (fullProfile == null) {
      final profileSheetProfileLoader =
          ref.watch(profileSheetProfileProvider(profile.id));
      final profileSheetPostsLoader =
          ref.watch(profileSheetPostsProvider(profile.id, authenticated));

      return Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: const EdgeInsets.only(
                top: spacingFive, left: spacingFive, right: spacingFive),
            child: ProfileHeaderMin(profile: profile)),
        Expanded(
            child: switch (profileSheetProfileLoader) {
          AsyncData(value: final profileValue) => profileValue.banned
              ? Padding(
                  padding: const EdgeInsets.all(spacingSeven),
                  child: Center(
                      child: SystemText(
                          text: AppLocalizations.of(context)!.profile_banned)))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            left: spacingFive,
                            right: spacingFive,
                            bottom: spacingFour),
                        child: ProfileHeaderDetails(
                            inChat: inChat,
                            profile: profileValue,
                            authenticated: authenticated)),
                    const SystemDivider(),
                    Flexible(
                        child: switch (profileSheetPostsLoader) {
                      AsyncData(value: final postsValue) =>
                        ProfileSheetPostsWidget(
                            profile: profile,
                            authenticated: authenticated,
                            posts: postsValue),
                      AsyncError() => SystemError(
                          onPressed: () => ref.invalidate(
                              profileSheetPostsProvider(
                                  profile.id, authenticated))),
                      _ => SystemLoader(
                          color: profile.color
                              .adjusted(ref.watch(resolvedBrightnessProvider)))
                    })
                  ],
                ),
          AsyncError() => SystemError(
              onPressed: () =>
                  ref.invalidate(profileSheetProfileProvider(profile.id))),
          _ => SystemLoader(
              color:
                  profile.color.adjusted(ref.watch(resolvedBrightnessProvider)))
        })
      ]));
    } else {
      final profileSheetPostsLoader = ref.watch(profilePostsProvider);

      return Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: const EdgeInsets.only(
                top: spacingFive, left: spacingFive, right: spacingFive),
            child: ProfileHeaderMin(profile: profile)),
        Expanded(
            child: fullProfile!.banned
                ? Padding(
                    padding: const EdgeInsets.all(spacingSeven),
                    child: Center(
                        child: SystemText(
                            text:
                                AppLocalizations.of(context)!.profile_banned)))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                left: spacingFive,
                                right: spacingFive,
                                bottom: spacingFour),
                            child: ProfileHeaderDetails(
                                inChat: inChat,
                                profile: fullProfile!,
                                authenticated: authenticated)),
                        const SystemDivider(),
                        Flexible(
                            child: switch (profileSheetPostsLoader) {
                          AsyncData(value: final postsValue) =>
                            UserPosts(posts: postsValue, profile: fullProfile!),
                          AsyncError() => SystemError(
                              onPressed: () => ref.invalidate(
                                  profileSheetPostsProvider(
                                      profile.id, authenticated))),
                          _ => SystemLoader(
                              color: profile.color.adjusted(
                                  ref.watch(resolvedBrightnessProvider)))
                        })
                      ]))
      ]));
    }
  }
}
