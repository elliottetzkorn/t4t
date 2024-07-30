import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/components/login_sheet.dart';
import 'package:t4t/components/system_tap.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/like_min_data.dart';
import 'package:t4t/data/like_type_data.dart';
import 'package:t4t/data/post_data.dart';
import 'package:t4t/data/post_min_data.dart';
import 'package:t4t/data/profile_min_data.dart';
import 'package:t4t/design_system/system_button.dart';
import 'package:t4t/design_system/system_dialog.dart';
import 'package:t4t/design_system/system_sheet.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/design_system/system_text_button.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/extensions/strings_extensions.dart';
import 'package:t4t/pages/messages/messages_page.dart';
import 'package:t4t/pages/new_post_page.dart';
import 'package:t4t/providers/background_provider.dart';
import 'package:t4t/providers/notifications_provider.dart';
import 'package:t4t/providers/posts_authenticated_provider.dart';
import 'package:t4t/providers/profile_posts_provider.dart';
import 'package:t4t/providers/profile_sheet_posts_provider.dart';
import 'package:t4t/providers/router_provider.dart';
import 'package:t4t/utils/network_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PostReactions extends ConsumerStatefulWidget {
  const PostReactions(
      {super.key,
      required this.post,
      required this.like,
      required this.profile,
      this.onButtonsPressed,
      this.inChat = false,
      this.replyPressed,
      this.likeCount,
      required this.authenticated});

  final PostData post;
  final ProfileMinData profile;
  final LikeMinData? like;
  final VoidCallback? onButtonsPressed;
  final int? likeCount;
  final bool inChat;
  final VoidCallback? replyPressed;
  final bool authenticated;

  @override
  ConsumerState<PostReactions> createState() => _PostReactionsState();
}

class _PostReactionsState extends ConsumerState<PostReactions> {
  bool likeLoading = false;

  void handleAnyButtonPressed() {
    if (widget.onButtonsPressed != null) {
      widget.onButtonsPressed!();
    }
  }

  void editPost(BuildContext context) {
    ref.read(backgroundProvider.notifier).toggle();

    SystemSheet.show(
      maxHeightPercent: maxPercentPost,
      context: context,
      child: NewPostPage(post: widget.post),
      whenComplete: () {
        handleAnyButtonPressed();
        ref.read(backgroundProvider.notifier).toggle();
      },
    );
  }

  Future<void> checkDelete(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SystemDialog(
          subTitle: AppLocalizations.of(context)!.delete_post_body,
          children: <Widget>[
            SystemTextButton(
              text: AppLocalizations.of(context)!.no,
              profile: null,
              onPressed: () => context.pop(),
            ),
            SystemTextButton(
              text: AppLocalizations.of(context)!.yes,
              profile: null,
              onPressed: () {
                deletePost();
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> deletePost() async {
    handleAnyButtonPressed();
    await NetworkUtils.safeNetworkCall(context, () {
      return Supabase.instance.client
          .from('posts')
          .update({'deleted': true}).eq('id', widget.post.id);
    }, (value) {
      ref.read(postsAuthenticatedProvider.notifier).removePost(widget.post.id);
      ref.read(profilePostsProvider.notifier).removePost(widget.post.id);
      ref.read(notificationsProvider.notifier).removeNotif(widget.post.id);
    }, () {}, false);
  }

  void replyToPost(BuildContext context, WidgetRef ref) {
    if (widget.authenticated) {
      if (widget.inChat) {
        widget.replyPressed!();
        ref.read(routerProvider).replaceNamed(routemMessages,
            extra: MessagePageData(
                profile: widget.profile,
                post: PostMinData(
                    id: widget.post.id,
                    title: widget.post.title,
                    body: widget.post.body)));
        context.pop();
      } else {
        Navigator.of(context).popUntil((route) => route.isFirst);
        ref.read(routerProvider).pushNamed(routemMessages,
            extra: MessagePageData(
                profile: widget.profile,
                post: PostMinData(
                    id: widget.post.id,
                    title: widget.post.title,
                    body: widget.post.body)));
      }
    } else {
      LoginSheet(context: context).show();
    }
  }

  Future<void> toggleLike(LikeTypeData? likeType) async {
    if (widget.authenticated) {
      if (!likeLoading) {
        (widget.like != null && widget.like!.id != null
            ? deleteLike()
            : insertLike(likeType!));
      }
    } else {
      LoginSheet(context: context).show();
    }
  }

  Future<void> changeLikeDialog(LikeTypeData likeType) async {
    if (!likeLoading) {
      if (widget.like == null || widget.like!.id == null) {
        insertLike(likeType);
      } else if (widget.like!.likeTypeId != likeType.id) {
        updateLike(likeType);
      }
    }
  }

  Future<void> deleteLike() async {
    setState(() {
      likeLoading = true;
    });

    removeLike(widget.post.id);

    await NetworkUtils.safeNetworkCall(
        context,
        () {
          return Supabase.instance.client
              .from('likes')
              .delete()
              .eq('id', widget.like!.id!);
        },
        (_) {},
        () {
          addLike(
              LikeMinData(
                  likeTypeId: widget.like!.likeTypeId, id: widget.like!.id),
              widget.post.id);
        },
        false);

    setState(() => likeLoading = false);
  }

  Future<void> updateLike(LikeTypeData likeType) async {
    setState(() {
      likeLoading = true;
    });

    addLike(LikeMinData(likeTypeId: likeType.id), widget.post.id);

    await NetworkUtils.safeNetworkCall(context, () {
      return Supabase.instance.client
          .from('likes')
          .update({'like_type_id': likeType.id}).eq('id', widget.like!.id!);
    }, (_) {
      LikeMinData like =
          LikeMinData(id: widget.like!.id, likeTypeId: likeType.id);
      addLike(like, widget.post.id);
    }, () {
      removeLike(widget.post.id);
    }, false);

    setState(() => likeLoading = false);
  }

  Future<void> insertLike(LikeTypeData likeType) async {
    setState(() {
      likeLoading = true;
    });

    addLike(LikeMinData(likeTypeId: likeType.id), widget.post.id);

    await NetworkUtils.safeNetworkCall(context, () {
      return Supabase.instance.client
          .from('likes')
          .insert({
            'profile_id': Supabase.instance.client.auth.currentSession!.user.id,
            'post_id': widget.post.id,
            'like_type_id': likeType.id
          })
          .select('''
*,
      like_type:like_type_id(
        *
      )
''')
          .limit(1)
          .single();
    }, (value) {
      LikeMinData like = LikeMinData.fromMap(value);
      addLike(like, widget.post.id);
    }, () {
      removeLike(widget.post.id);
    }, false);

    setState(() => likeLoading = false);
  }

  void addLike(LikeMinData like, int postId) {
    ref.read(postsAuthenticatedProvider.notifier).addLike(like, postId);
    ref
        .read(profileSheetPostsProvider(widget.profile.id, widget.authenticated)
            .notifier)
        .addLike(like, postId);
  }

  void removeLike(int postId) {
    ref.read(postsAuthenticatedProvider.notifier).removeLike(postId);
    ref
        .read(profileSheetPostsProvider(widget.profile.id, widget.authenticated)
            .notifier)
        .removeLike(postId);
  }

  Future<void> showOtherLikes() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => Dialog(
          backgroundColor: Theme.of(context).cardColor,
          child: Padding(
              padding: const EdgeInsets.all(spacingFive),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (LikeTypeData likeType in likeTypes)
                    SystemTap(
                        onTap: () {
                          changeLikeDialog(likeType);
                          context.pop();
                        },
                        child: SystemText(
                            text: likeType.text, size: TextSizeEnum.twentyNine))
                ],
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      widget.profile.id.isOwnId()
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (widget.likeCount != null && widget.likeCount != 0)
                  SystemText(
                      size: TextSizeEnum.twelve,
                      text: widget.likeCount == 1
                          ? '1 ${AppLocalizations.of(context)!.react}'
                          : '${widget.likeCount} ${AppLocalizations.of(context)!.reacts}',
                      color: Theme.of(context).colorScheme.primary),
                Expanded(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SystemButton(
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        backgroundColorTapped:
                            Theme.of(context).colorScheme.tertiary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimaryContainer,
                        text: AppLocalizations.of(context)!.edit,
                        onPressed: () => editPost(context)),
                    const SizedBox(
                      width: spacingFive,
                    ),
                    SystemButton(
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        backgroundColorTapped:
                            Theme.of(context).colorScheme.tertiary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimaryContainer,
                        text: AppLocalizations.of(context)!.delete,
                        onPressed: () => checkDelete(context))
                  ],
                ))
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SystemTap(
                  child: SizedBox(
                      height: tapTarget,
                      width: tapTarget,
                      child: Center(
                          child: widget.like == null
                              ? Icon(PhosphorIcons.spiral_thin,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 26)
                              : SystemText(
                                  text: likeTypes
                                      .firstWhere((element) =>
                                          element.id == widget.like!.likeTypeId)
                                      .text,
                                  size: TextSizeEnum.twentyNine,
                                ))),
                  onTap: () => toggleLike(likeTypes.first),
                  onLongPress: () {
                    if (!likeLoading) {
                      showOtherLikes();
                    }
                  },
                ),
                Row(
                  children: [
                    SystemButton(
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        backgroundColorTapped:
                            Theme.of(context).colorScheme.tertiary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimaryContainer,
                        text: AppLocalizations.of(context)!.reply,
                        onPressed: () => replyToPost(context, ref))
                  ],
                )
              ],
            )
    ]);
  }
}
