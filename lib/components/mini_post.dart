import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:t4t/components/view_post_sheet.dart';
import 'package:t4t/data/post_min_data.dart';
import 'package:t4t/data/profile_min_data.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/constants.dart';

class MiniPost extends StatelessWidget {
  const MiniPost(
      {super.key,
      required this.post,
      required this.fromSelf,
      required this.profile,
      this.enabled = true});

  final PostMinData post;
  final bool fromSelf;
  final bool enabled;
  final ProfileMinData profile;

  @override
  Widget build(BuildContext context) {
    double dimen = MediaQuery.of(context).size.width / 1.5;
    return Align(
        alignment: fromSelf ? Alignment.centerRight : Alignment.centerLeft,
        child: Padding(
            padding: const EdgeInsets.only(bottom: spacingFour),
            child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  HapticFeedback.selectionClick();
                  ViewPostSheet().show(context, post);
                },
                child: Container(
                    padding: const EdgeInsets.all(spacingFive),
                    width: dimen,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(inputRadius),
                      border: Border.all(
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Theme.of(context).colorScheme.secondary,
                          width: thinLine),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SystemText(
                          text: post.title,
                          maxLines: 1,
                          underline: true,
                          size: TextSizeEnum.fifteen,
                        ),
                        const SizedBox(height: spacingThree),
                        SystemText(
                          text: post.body,
                          maxLines: 3,
                          size: TextSizeEnum.fifteen,
                        ),
                      ],
                    )))));
  }
}
