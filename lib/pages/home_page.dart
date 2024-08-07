import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/design_system/system_confetti.dart';
import 'package:t4t/pages/home_authenticated.dart';
import 'package:t4t/pages/home_unauthenticated.dart';
import 'package:t4t/providers/authenticated_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key, this.userName, this.postId});

  final String? userName;
  final int? postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenticated = ref.watch(authenticatedProvider).asData?.value;

    return SystemConfetti(
        child: authenticated == null
            ? const SizedBox.shrink()
            : authenticated
                ? HomeAuthenticated(userName: userName, postId: postId)
                : const HomeUnauthenticated());
  }
}
