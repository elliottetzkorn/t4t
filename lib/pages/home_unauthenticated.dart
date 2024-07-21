import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/bottom_nav_unauthenticated.dart';
import 'package:t4t/pages/posts_page.dart';
import 'package:t4t/providers/posts_unauthenticated_provider.dart';

class HomeUnauthenticated extends ConsumerStatefulWidget {
  const HomeUnauthenticated({super.key});

  @override
  ConsumerState<HomeUnauthenticated> createState() =>
      _HomePageUnauthenticatedState();
}

class _HomePageUnauthenticatedState extends ConsumerState<HomeUnauthenticated>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        ref.read(postsUnauthenticatedProvider.notifier).poll();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
            child: PostsPage(
          scrollController: controller,
          authenticated: false,
        )),
        BottomNavUnauthenticated(postsController: controller)
      ],
    )));
  }
}
