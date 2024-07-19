import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/design_system/system_error.dart';
import 'package:t4t/design_system/system_loader.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/providers/admin_user_posts_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdminUserPosts extends ConsumerWidget {
  const AdminUserPosts({super.key, required this.pid});

  final String pid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(adminUserPostsProvider(pid));

    return Center(
        child: switch (posts) {
      AsyncData(value: final postsValue) => postsValue.isEmpty
          ? SystemText(text: AppLocalizations.of(context)!.no_posts)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (final post in postsValue)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SystemText(text: post.title, size: TextSizeEnum.eighteen),
                      const SizedBox(height: spacingTwo),
                      SystemText(text: post.body),
                      const SizedBox(height: spacingSix),
                    ],
                  )
              ],
            ),
      AsyncError() => SystemError(
          onPressed: () => ref.invalidate(adminUserPostsProvider(pid))),
      _ => const SystemLoader()
    });
  }
}
