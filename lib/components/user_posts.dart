import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/post_cell.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/data/user_post_data.dart';
import 'package:t4t/design_system/system_loader.dart';
import 'package:t4t/extensions/color_extensions.dart';
import 'package:t4t/extensions/profile_extensions.dart';
import 'package:t4t/providers/profile_posts_provider.dart';
import 'package:t4t/providers/resolved_brightness_provider.dart';

class UserPosts extends ConsumerWidget {
  const UserPosts({super.key, required this.posts, required this.profile});

  final ProfileData profile;

  final List<UserPostData> posts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + spacingFive,
          top: spacingFive,
          left: spacingFive,
          right: spacingFive),
      itemCount: posts.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: spacingSix * 1.5,
      ),
      itemBuilder: (context, i) {
        return Builder(builder: (context) {
          final post = posts[i];

          if (i == posts.length - 1 && posts.length % fetchQty == 0) {
            ref.read(profilePostsProvider.notifier).scroll();
          }

          return Column(children: [
            PostCell(
                authenticated: true,
                showUsername: false,
                post: post.post,
                like: null,
                likeCount: post.likeCount,
                profile: profile.min(),
                onSheet: true),
            if (i == posts.length - 1 && posts.length % fetchQty == 0)
              SystemLoader(
                  color: profile.color
                      .adjusted(ref.watch(resolvedBrightnessProvider)))
          ]);
        });
      },
    );
  }
}
