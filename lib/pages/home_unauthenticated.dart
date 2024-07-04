import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/bottom_nav_unauthenticated.dart';
import 'package:t4t/pages/posts_page.dart';

class HomeUnauthenticated extends ConsumerWidget {
  const HomeUnauthenticated({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
