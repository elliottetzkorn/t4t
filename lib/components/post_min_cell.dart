import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/data/post_min_data.dart';
import 'package:t4t/design_system/system_linkable_text.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/constants.dart';

class PostMinCell extends ConsumerWidget {
  const PostMinCell({super.key, required this.post});

  final PostMinData post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SystemText(
              underline: true, text: post.title, size: TextSizeEnum.eighteen),
          const SizedBox(
            height: spacingThree,
          ),
          SystemLinkableText(
              text: post.body, color: Theme.of(context).colorScheme.secondary),
          const SizedBox(
            height: spacingFour,
          ),
        ]);
  }
}
