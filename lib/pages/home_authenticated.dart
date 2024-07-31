import 'dart:async';
import 'package:app_install_date/app_install_date_imp.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/components/bottom_nav_authenticated.dart';
import 'package:t4t/components/supporter_sheet.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/extensions/profile_extensions.dart';
import 'package:t4t/extensions/router_extensions.dart';
import 'package:t4t/pages/posts_page.dart';
import 'package:t4t/pages/messages/conversations_page.dart';
import 'package:t4t/pages/reactions_page.dart';
import 'package:t4t/pages/profile_page.dart';
import 'package:t4t/providers/conversations_provider.dart';
import 'package:t4t/providers/background_provider.dart';
import 'package:t4t/providers/notifications_provider.dart';
import 'package:t4t/providers/posts_authenticated_provider.dart';
import 'package:t4t/providers/profile_provider.dart';
import 'package:t4t/providers/router_provider.dart';
import 'package:t4t/providers/tab_provider.dart';
import 'package:t4t/utils/store_config.dart';

class HomeAuthenticated extends ConsumerStatefulWidget {
  const HomeAuthenticated({super.key});

  @override
  ConsumerState<HomeAuthenticated> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomeAuthenticated>
    with WidgetsBindingObserver {
  late final PageController pageController;
  late ScrollController postsScrollController;
  late ScrollController chatsScrollController;
  late ScrollController notifsScrollController;
  late ScrollController profileScrollController;
  Timer? pollTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    userId = Supabase.instance.client.auth.currentUser!.id;

    postsScrollController = ScrollController();
    chatsScrollController = ScrollController();
    notifsScrollController = ScrollController();
    profileScrollController = ScrollController();
    pageController = PageController(initialPage: ref.read(tabProvider).index);

    setPollTimers();
  }

  @override
  void dispose() {
    endPollTimers();
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  void setPollTimers() {
    if (pollTimer != null) {
      pollTimer!.cancel();
    }

    pollTimer = Timer.periodic(const Duration(seconds: pollingTime), (Timer t) {
      getPolls(false);
    });
  }

  void getPolls(bool initial) {
    if (mounted) {
      ref.read(postsAuthenticatedProvider.notifier).poll(initial);
      ref.read(conversationsProvider.notifier).poll();
      ref.read(notificationsProvider.notifier).poll();
    }
  }

  void endPollTimers() {
    if (pollTimer != null) {
      pollTimer!.cancel();
      pollTimer = null;
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        ref.invalidate(profileProvider);
        getPolls(true);
        setPollTimers();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        endPollTimers();
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(profileProvider, (previous, next) {
      final profile = next.value;

      if (profile != null) {
        if (profile.banned) {
          ref.read(routerProvider).replaceNamed(routeBanned);
        } else if (profile.incomplete()) {
          ref.read(routerProvider).toProfileSetup(profile, ref);
        } else {
          if (!profile.supporter) {
            String? lastTimeString =
                prefs.getString(prefsPremiumUpsellShowTime);

            if (lastTimeString == null) {
              AppInstallDate().installDate.then((date) {
                if (DateTime.now().difference(date).inDays > 7) {
                  SupporterSheet().show(context, ref);
                  prefs.setString(prefsPremiumUpsellShowTime,
                      DateTime.now().toIso8601String());
                }
              });
            } else {
              DateTime lastTimeShown = DateTime.parse(lastTimeString);

              if (DateTime.now().difference(lastTimeShown).inDays > 30) {
                SupporterSheet().show(context, ref);
                prefs.setString(prefsPremiumUpsellShowTime,
                    DateTime.now().toIso8601String());
              }
            }
          }

          FirebaseMessaging.instance.getToken().then((value) {
            if (value != null && profile.fcmToken != value) {
              ref.read(profileProvider.notifier).updateFCMToken(value);
            }
          });

          Purchases.configure(
              PurchasesConfiguration(StoreConfig.instance.apiKey)
                ..appUserID = profile.id);
        }
      }
    });

    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Stack(children: [
        Column(
          children: [
            Expanded(
                child: PageView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    allowImplicitScrolling: true,
                    itemBuilder: (_, i) {
                      switch (i) {
                        case 1:
                          return ConversationsPage(
                            scrollController: chatsScrollController,
                          );
                        case 2:
                          return ReactionsPage(
                            scrollController: notifsScrollController,
                          );
                        case 3:
                          return ProfilePage(
                              scrollController: profileScrollController);
                        case 0:
                        default:
                          return PostsPage(
                            scrollController: postsScrollController,
                            authenticated: true,
                          );
                      }
                    })),
            BottomNavAuthenticated(
              pageController: pageController,
              postsController: postsScrollController,
              conversationsController: chatsScrollController,
              notificationsController: notifsScrollController,
              profileController: profileScrollController,
            )
          ],
        ),
        IgnorePointer(
            child: AnimatedOpacity(
                duration: const Duration(milliseconds: animationDuration),
                curve: animationCurve,
                opacity: ref.watch(backgroundProvider) ? 1 : 0,
                child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor))),
      ])),
    ));
  }
}
