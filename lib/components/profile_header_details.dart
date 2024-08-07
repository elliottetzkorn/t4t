import 'dart:async';
import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/design_system/system_button.dart';
import 'package:t4t/design_system/system_dialog.dart';
import 'package:t4t/design_system/system_linkable_text.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/design_system/system_text_button.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/extensions/astrological_sign_enum_extensions.dart';
import 'package:t4t/extensions/color_extensions.dart';
import 'package:t4t/extensions/date_time_extensions.dart';
import 'package:t4t/extensions/profile_extensions.dart';
import 'package:t4t/extensions/strings_extensions.dart';
import 'package:t4t/pages/messages/messages_page.dart';
import 'package:t4t/providers/conversations_provider.dart';
import 'package:t4t/providers/notifications_provider.dart';
import 'package:t4t/providers/posts_authenticated_provider.dart';
import 'package:t4t/providers/resolved_brightness_provider.dart';
import 'package:t4t/providers/router_provider.dart';
import 'package:t4t/repositories/profile_sheet_profile_repository.dart';
import 'package:t4t/utils/location_utils.dart';

class ProfileHeaderDetails extends ConsumerWidget {
  const ProfileHeaderDetails(
      {super.key,
      required this.profile,
      this.inChat = false,
      this.replyPressed,
      required this.authenticated});

  final ProfileData profile;
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
                Navigator.of(context).popUntil((route) => route.isFirst);
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

  void goToConversation(
      BuildContext context, WidgetRef ref, ProfileData profile) {
    if (inChat) {
      ref.read(routerProvider).pop();
    } else {
      Navigator.of(context).popUntil((route) => route.isFirst);
      ref.read(routerProvider).pushNamed(routemMessages,
          extra: MessagePageData(profile: profile.min()));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: spacingTwo,
        ),
        SystemText(
          text:
              "${AgeCalculator.age(profile.birthday!).years}, ${raceString(profile)}${profile.showAstro ? '${profile.birthday!.toAstrologicalSign().toLocalizedString(context).toLowerCase()}, ' : ''}${profile.pronouns!.toLowerCase()}${distance(profile)}",
        ),
        if (profile.bio != null && profile.bio!.isNotEmpty)
          Column(
            children: [
              const SizedBox(
                height: spacingThree,
              ),
              SystemLinkableText(
                  size: TextSizeEnum.twelve,
                  text: profile.bio!,
                  color: Theme.of(context).colorScheme.secondary),
            ],
          ),
        const SizedBox(
          height: spacingThree,
        ),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: spacingFour,
          runSpacing: spacingThree,
          children: <Widget>[
            for (int j = 0; j < profile.badges!.length; j++)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SystemText(
                    text: profile.badges![j].text,
                    color: profile.badges![j].color
                        .adjusted(ref.watch(resolvedBrightnessProvider)),
                  ),
                  if (j < profile.badges!.length - 1)
                    SystemText(
                      text: ',',
                      color: Theme.of(context).colorScheme.secondary,
                    )
                ],
              ),
          ],
        ),
        const SizedBox(
          height: spacingFour,
        ),
        if (authenticated && !profile.id.isOwnId())
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SystemTextButton(
                light: true,
                text: AppLocalizations.of(context)!.report,
                onPressed: () => checkIfBan(context, profile.id),
              ),
              SystemTextButton(
                light: true,
                text: AppLocalizations.of(context)!.block,
                onPressed: () => checkIfBlock(context, profile.id, ref),
              ),
              SystemTextButton(
                light: true,
                text: AppLocalizations.of(context)!.share,
                onPressed: () => {
                  Share.shareUri(
                    Uri.parse('https://t4t.social/@${profile.username}'),
                  )
                },
              ),
              Padding(
                  padding: const EdgeInsets.only(left: spacingFive),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: SystemButton(
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        backgroundColorTapped:
                            Theme.of(context).colorScheme.tertiary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimaryContainer,
                        onPressed: () =>
                            goToConversation(context, ref, profile),
                        text: AppLocalizations.of(context)!.message,
                      )))
            ],
          )
      ],
    );
  }
}
