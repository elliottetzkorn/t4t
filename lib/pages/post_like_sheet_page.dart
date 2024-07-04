import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/profile_sheet.dart';
import 'package:t4t/components/system_tap.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/profile_min_data.dart';
import 'package:t4t/design_system/system_error.dart';
import 'package:t4t/design_system/system_loader.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/extensions/color_extensions.dart';
import 'package:t4t/extensions/like_data_extensions.dart';
import 'package:t4t/providers/likes_provider.dart';
import 'package:t4t/providers/resolved_brightness_provider.dart';

class PostLikeSheetPage extends ConsumerWidget {
  const PostLikeSheetPage({super.key, required this.postId});

  final int postId;

  void goToProfile(BuildContext context, ProfileMinData profile) {
    ProfileSheet().show(context, profile, false, true, () {}, null);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likes = ref.watch(likesProvider(postId));

    return Center(
        child: switch (likes) {
      AsyncData(:final value) => ListView.separated(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + spacingFive,
              top: spacingFive,
              left: spacingFive,
              right: spacingFive),
          itemCount: value.length,
          separatorBuilder: (context, index) => const SizedBox(
                height: spacingSix,
              ),
          itemBuilder: (context, i) {
            return Builder(builder: (context) {
              final likeType = value[i];

              if (i == value.length - 1 && value.length % fetchQty == 0) {
                ref.read(likesProvider(postId).notifier).scroll();
              }

              return Column(children: [
                SystemTap(
                    onTap: () => goToProfile(context, likeType.min()),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SystemText(
                            color: Theme.of(context).colorScheme.secondary,
                            text:
                                '${likeType.likeTypeText} ${AppLocalizations.of(context)!.from}',
                          ),
                          SystemText(
                              underline: true,
                              text: '@${likeType.username}',
                              color: likeType.color.adjusted(
                                  ref.watch(resolvedBrightnessProvider))),
                        ])),
                if (i == value.length - 1 && value.length % fetchQty == 0)
                  const SystemLoader()
              ]);
            });
          }),
      AsyncError() =>
        SystemError(onPressed: () => ref.invalidate(likesProvider(postId))),
      _ => const SystemLoader(),
    });
  }
}
