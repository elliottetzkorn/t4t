import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/post_cell.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/profile_min_data.dart';
import 'package:t4t/data/profile_sheet_post_data.dart';
import 'package:t4t/design_system/system_loader.dart';
import 'package:t4t/extensions/color_extensions.dart';
import 'package:t4t/providers/profile_sheet_posts_provider.dart';
import 'package:t4t/providers/resolved_brightness_provider.dart';

class ProfileSheetPostsWidget extends ConsumerWidget {
  const ProfileSheetPostsWidget(
      {super.key,
      required this.profile,
      required this.authenticated,
      required this.posts});

  final ProfileMinData profile;
  final bool authenticated;
  final List<ProfileSheetPostData> posts;

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
            ref
                .read(profileSheetPostsProvider(profile.id, authenticated)
                    .notifier)
                .scroll(profile.id, authenticated);
          }

          return Column(children: [
            PostCell(
                authenticated: authenticated,
                showUsername: false,
                post: post.post,
                like: post.like,
                profile: profile,
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
