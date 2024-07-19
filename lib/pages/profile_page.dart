import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/header.dart';
import 'package:t4t/components/navigation_cell.dart';
import 'package:t4t/components/profile_sheet.dart';
import 'package:t4t/components/supporter_sheet.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/location_data.dart';
import 'package:t4t/design_system/system_divider.dart';
import 'package:t4t/design_system/system_error.dart';
import 'package:t4t/design_system/system_loader.dart';
import 'package:t4t/design_system/system_sheet.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/design_system/system_text_button.dart';
import 'package:t4t/enums/profile_page_pages_enum.dart';
import 'package:t4t/extensions/astrological_sign_enum_extensions.dart';
import 'package:t4t/extensions/color_extensions.dart';
import 'package:t4t/extensions/date_time_extensions.dart';
import 'package:t4t/extensions/profile_extensions.dart';
import 'package:t4t/extensions/profile_page_pages_enum_extensions.dart';
import 'package:t4t/pages/settings/settings_age_page.dart';
import 'package:t4t/pages/settings/settings_badges_page.dart';
import 'package:t4t/pages/settings/settings_bio_page.dart';
import 'package:t4t/pages/settings/settings_color_page.dart';
import 'package:t4t/pages/settings/settings_pronouns_page.dart';
import 'package:t4t/pages/settings/settings_race_page.dart';
import 'package:t4t/pages/settings/settings_user_name_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/providers/posts_authenticated_provider.dart';
import 'package:t4t/providers/profile_provider.dart';
import 'package:t4t/providers/resolved_brightness_provider.dart';
import 'package:t4t/providers/router_provider.dart';
import 'package:t4t/providers/subscribing_provider.dart';
import 'package:t4t/utils/location_utils.dart';
import 'package:t4t/utils/social_utils.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  bool updatingLocation = false;

  Future<void> _getLocationAndUpdateProfile() async {
    setState(() => updatingLocation = true);

    await LocationUtils.getLocation(context).then((value) {
      if (value == null) {
        setState(() {
          updatingLocation = false;
        });
      } else {
        _updateProfile(value);
      }
    }).catchError((error) {
      setState(() => updatingLocation = false);
    });
  }

  Future<void> _updateProfile(LocationData location) async {
    setState(() => updatingLocation = true);

    await ref.read(profileProvider.notifier).updateLocation(location).then((_) {
      ref.invalidate(postsAuthenticatedProvider);
    });

    setState(() => updatingLocation = false);
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(profileProvider);

    return Center(
      child: switch (profile) {
        AsyncData(value: final profileValue) => ListView(
              controller: widget.scrollController,
              padding: const EdgeInsets.only(
                bottom: spacingSeven,
              ),
              children: [
                Header(title: AppLocalizations.of(context)!.profile),
                Padding(
                    padding: const EdgeInsets.only(
                      top: spacingFour,
                      left: spacingFive,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: SystemText(
                              text: '@${profileValue.username}',
                              color: profileValue.color.adjusted(
                                  ref.watch(resolvedBrightnessProvider)),
                            )),
                            const SizedBox(
                              width: spacingFive,
                            ),
                            SystemTextButton(
                              text: AppLocalizations.of(context)!.edit,
                              onPressed: () {
                                SystemSheet.show(
                                    context: context,
                                    child: SettingsUserNamePage(
                                        profile: profileValue));
                              },
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: SystemText(
                              text:
                                  "${AgeCalculator.age(profileValue.birthday!).years}${profileValue.showAstro ? ', ${profileValue.birthday!.toAstrologicalSign().toLocalizedString(context).toLowerCase()}' : ''}",
                            )),
                            const SizedBox(
                              width: spacingFive,
                            ),
                            SystemTextButton(
                              text: AppLocalizations.of(context)!.edit,
                              onPressed: () {
                                SystemSheet.show(
                                    context: context,
                                    child:
                                        SettingsAgePage(profile: profileValue));
                              },
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: SystemText(
                              text: profileValue.race == null ||
                                      profileValue.race!.isEmpty
                                  ? '(${AppLocalizations.of(context)!.race})'
                                  : profileValue.race!,
                            )),
                            const SizedBox(
                              width: spacingFive,
                            ),
                            SystemTextButton(
                              text: AppLocalizations.of(context)!.edit,
                              onPressed: () {
                                SystemSheet.show(
                                    context: context,
                                    child: SettingsRacePage(
                                        profile: profileValue));
                              },
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: SystemText(
                              text: profileValue.pronouns!.toLowerCase(),
                            )),
                            const SizedBox(
                              width: spacingFive,
                            ),
                            SystemTextButton(
                              text: AppLocalizations.of(context)!.edit,
                              onPressed: () {
                                SystemSheet.show(
                                    context: context,
                                    child: SettingsPronounsPage(
                                        profile: profileValue));
                              },
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Wrap(
                              alignment: WrapAlignment.start,
                              spacing: spacingFour,
                              runSpacing: spacingFour,
                              children: <Widget>[
                                for (int j = 0;
                                    j < profileValue.badges!.length;
                                    j++)
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SystemText(
                                        text: profileValue.badges![j].text,
                                        color: profileValue.badges![j].color
                                            .adjusted(ref.watch(
                                                resolvedBrightnessProvider)),
                                      ),
                                      if (j < profileValue.badges!.length - 1)
                                        const SystemText(
                                          text: ',',
                                        )
                                    ],
                                  ),
                              ],
                            )),
                            const SizedBox(
                              width: spacingFive,
                            ),
                            SystemTextButton(
                              text: AppLocalizations.of(context)!.edit,
                              onPressed: () {
                                SystemSheet.show(
                                    context: context,
                                    child: SettingsBadgesPage(
                                        profile: profileValue));
                              },
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: SystemText(
                              maxLines: 1,
                              text: profileValue.bio == null ||
                                      profileValue.bio!.isEmpty
                                  ? '(${AppLocalizations.of(context)!.settings_bio_title.toLowerCase()})'
                                  : profileValue.bio!,
                              color: Theme.of(context).colorScheme.secondary,
                            )),
                            const SizedBox(
                              width: spacingFive,
                            ),
                            SystemTextButton(
                              text: AppLocalizations.of(context)!.edit,
                              onPressed: () {
                                SystemSheet.show(
                                    context: context,
                                    child:
                                        SettingsBioPage(profile: profileValue));
                              },
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: SystemText(
                              text: '#${profileValue.color.toHex()} (color)',
                              color: profileValue.color.adjusted(
                                  ref.watch(resolvedBrightnessProvider)),
                            )),
                            const SizedBox(
                              width: spacingFive,
                            ),
                            SystemTextButton(
                              text: AppLocalizations.of(context)!.edit,
                              onPressed: () {
                                SystemSheet.show(
                                    context: context,
                                    child: SettingsColorPage(
                                        profile: profileValue));
                              },
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: SystemText(
                              maxLines: 1,
                              text: profileValue.neighborhood == null ||
                                      profileValue.state == null
                                  ? AppLocalizations.of(context)!.no_location
                                  : LocationUtils.formatted(
                                      profileValue.neighborhood,
                                      profileValue.city!,
                                      profileValue.state,
                                      profileValue.country!,
                                    ),
                            )),
                            const SizedBox(
                              width: spacingFive,
                            ),
                            SystemTextButton(
                              text: updatingLocation
                                  ? AppLocalizations.of(context)!
                                      .post_sheet_room_update_posting
                                  : AppLocalizations.of(context)!
                                      .post_sheet_room_update_post,
                              onPressed: _getLocationAndUpdateProfile,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                if (!profileValue.supporter)
                                  SystemText(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    maxLines: 1,
                                    text: AppLocalizations.of(context)!
                                        .supporter_become
                                        .toLowerCase(),
                                  ),
                                SystemText(
                                  color: Theme.of(context).colorScheme.error,
                                  maxLines: 1,
                                  text:
                                      '✨${AppLocalizations.of(context)!.supporter}',
                                ),
                                if (profileValue.supporter &&
                                    !profileValue.showSupporter)
                                  SystemText(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    maxLines: 1,
                                    text:
                                        ' ${AppLocalizations.of(context)!.hidden}',
                                  )
                              ],
                            )),
                            const SizedBox(
                              width: spacingFive,
                            ),
                            SystemTextButton(
                              text: ref.watch(subscribingProvider)
                                  ? AppLocalizations.of(context)!
                                      .post_sheet_room_update_posting
                                  : profileValue.supporter
                                      ? AppLocalizations.of(context)!.change
                                      : AppLocalizations.of(context)!
                                          .support_learn,
                              onPressed: () {
                                if (!ref.watch(subscribingProvider)) {
                                  if (profileValue.supporter) {
                                    ref
                                        .read(routerProvider)
                                        .pushNamed(routeSettingsSupporter);
                                  } else {
                                    SupporterSheet().show(context, ref);
                                  }
                                }
                              },
                            )
                          ],
                        ),
                        const SizedBox(
                          height: spacingSix,
                        ),
                        const Padding(
                            padding: EdgeInsets.only(right: spacingFive),
                            child: SystemDivider()),
                        const SizedBox(
                          height: spacingFive,
                        ),
                      ],
                    )),
                NavigationCell(
                    title: ProfilePagePagesEnum.preview.title(context),
                    subTitle: ProfilePagePagesEnum.preview.subTitle(context),
                    icon: PhosphorIcons.eye_thin,
                    onPressed: () => {
                          ProfileSheet().show(context, profileValue.min(),
                              false, true, () {}, profileValue)
                        }),
                if (profileValue.mod)
                  NavigationCell(
                      title: ProfilePagePagesEnum.mod.title(context),
                      subTitle: ProfilePagePagesEnum.mod.subTitle(context),
                      icon: PhosphorIcons.scales_thin,
                      onPressed: () => {
                            ref.read(routerProvider).pushNamed(routeSettingsMod)
                          }),
                NavigationCell(
                    embedded: false,
                    title: ProfilePagePagesEnum.customization.title(context),
                    subTitle:
                        ProfilePagePagesEnum.customization.subTitle(context),
                    onPressed: () => ref
                        .read(routerProvider)
                        .pushNamed(routeSettingsAccessibility)),
                NavigationCell(
                    embedded: false,
                    title: AppLocalizations.of(context)!.settings_notifs_title,
                    subTitle: ProfilePagePagesEnum.reactions.subTitle(context),
                    onPressed: () => ref
                        .read(routerProvider)
                        .pushNamed(routeSettingsNotifs)),
                NavigationCell(
                    embedded: true,
                    title: ProfilePagePagesEnum.github.title(context),
                    subTitle: ProfilePagePagesEnum.github.subTitle(context),
                    icon: PhosphorIcons.github_logo_thin,
                    onPressed: () => SocialUtils.goToGithub()),
                NavigationCell(
                    embedded: false,
                    title: ProfilePagePagesEnum.account.title(context),
                    subTitle: ProfilePagePagesEnum.account.subTitle(context),
                    onPressed: () => ref
                        .read(routerProvider)
                        .pushNamed(routeSettingsAccount, extra: profileValue)),
                NavigationCell(
                    embedded: false,
                    title: ProfilePagePagesEnum.documents.title(context),
                    subTitle: ProfilePagePagesEnum.documents.subTitle(context),
                    onPressed: () => ref
                        .read(routerProvider)
                        .pushNamed(routeSettingsDocuments)),
              ]),
        AsyncError() => Column(children: [
            Header(
              title: AppLocalizations.of(context)!.profile,
            ),
            SystemError(onPressed: () => ref.invalidate(profileProvider))
          ]),
        _ => Column(children: [
            Header(
              title: AppLocalizations.of(context)!.profile,
            ),
            const Expanded(child: SystemLoader())
          ]),
      },
    );
  }
}
