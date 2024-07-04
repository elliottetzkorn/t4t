import 'package:flutter/material.dart';

import 'package:t4t/design_system/system_sheet.dart';
import 'package:t4t/pages/post_like_sheet_page.dart';

class PostLikeSheet {
  PostLikeSheet();

  void show(BuildContext context, int postId) {
    SystemSheet.show(
        maxHeightPercent: 0.6,
        whenComplete: () {},
        noBottomSafeArea: true,
        context: context,
        child: PostLikeSheetPage(postId: postId));
  }
}
