import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/pages/banned_page.dart';
import 'package:t4t/pages/home_page.dart';
import 'package:t4t/pages/messages/messages_page.dart';
import 'package:t4t/pages/settings/mod_page.dart';
import 'package:t4t/pages/settings/settings_customization_page.dart';
import 'package:t4t/pages/settings/settings_account_page.dart';
import 'package:t4t/pages/settings/settings_documents_page.dart';
import 'package:t4t/pages/settings/settings_notifs_page.dart';
import 'package:t4t/pages/settings/settings_supporter_page.dart';
import 'package:t4t/pages/setup/setup_age_page.dart';
import 'package:t4t/pages/setup/setup_badges_page.dart';
import 'package:t4t/pages/setup/setup_bio_page.dart';
import 'package:t4t/pages/setup/setup_location_page.dart';
import 'package:t4t/pages/setup/setup_pronouns_page.dart';
import 'package:t4t/pages/setup/setup_race_page.dart';
import 'package:t4t/pages/setup/setup_user_name_page.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(initialLocation: '/', routes: <RouteBase>[
    GoRoute(
        name: routeHome,
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: [
          GoRoute(
            name: routeBanned,
            path: routeBanned,
            builder: (BuildContext context, GoRouterState state) {
              return const Banned();
            },
          ),
          GoRoute(
            name: routeSetupAge,
            path: routeSetupAge,
            builder: (BuildContext context, GoRouterState state) {
              return SetupAgePage(profile: state.extra as ProfileData);
            },
          ),
          GoRoute(
            name: routeSetupUsername,
            path: routeSetupUsername,
            builder: (BuildContext context, GoRouterState state) {
              return SetupUserNamePage(profile: state.extra as ProfileData);
            },
          ),
          GoRoute(
            name: routeSetupPronouns,
            path: routeSetupPronouns,
            builder: (BuildContext context, GoRouterState state) {
              return SetupPronounsPage(profile: state.extra as ProfileData);
            },
          ),
          GoRoute(
            name: routeSetupRace,
            path: routeSetupRace,
            builder: (BuildContext context, GoRouterState state) {
              return SetupRacePage(profile: state.extra as ProfileData);
            },
          ),
          GoRoute(
            name: routeSetupBio,
            path: routeSetupBio,
            builder: (BuildContext context, GoRouterState state) {
              return SetupBioPage(profile: state.extra as ProfileData);
            },
          ),
          GoRoute(
            name: routeSetupBadges,
            path: routeSetupBadges,
            builder: (BuildContext context, GoRouterState state) {
              return SetupBadgesPage(profile: state.extra as ProfileData);
            },
          ),
          GoRoute(
            name: routeSetupLocation,
            path: routeSetupLocation,
            builder: (BuildContext context, GoRouterState state) {
              return SetupLocationPage(profile: state.extra as ProfileData);
            },
          ),
          GoRoute(
              name: routemMessages,
              path: routemMessages,
              builder: (BuildContext context, GoRouterState state) {
                return MessagesPage(data: state.extra as MessagePageData);
              }),
          GoRoute(
            name: routeSettingsAccount,
            path: routeSettingsAccount,
            builder: (BuildContext context, GoRouterState state) {
              return SettingsAccountPage(profile: state.extra as ProfileData);
            },
          ),
          GoRoute(
            name: routeSettingsAccessibility,
            path: routeSettingsAccessibility,
            builder: (BuildContext context, GoRouterState state) {
              return const SettingsCustomizationPage();
            },
          ),
          GoRoute(
            name: routeSettingsSupporter,
            path: routeSettingsSupporter,
            builder: (BuildContext context, GoRouterState state) {
              return const SettingsSupporterPage();
            },
          ),
          GoRoute(
            name: routeSettingsMod,
            path: routeSettingsMod,
            builder: (BuildContext context, GoRouterState state) {
              return const ModPage();
            },
          ),
          GoRoute(
            name: routeSettingsNotifs,
            path: routeSettingsNotifs,
            builder: (BuildContext context, GoRouterState state) {
              return const SettingsNotifsPage();
            },
          ),
          GoRoute(
              name: routeSettingsDocuments,
              path: routeSettingsDocuments,
              builder: (BuildContext context, GoRouterState state) {
                return const SettingsDocumentsPage();
              },
              routes: [
                GoRoute(
                  name: routeSettingsLicenses,
                  path: routeSettingsLicenses,
                  builder: (BuildContext context, GoRouterState state) {
                    return const LicensePage();
                  },
                ),
              ]),
        ]),
  ]);
}
