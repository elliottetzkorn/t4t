import 'package:flutter/material.dart';
import 'package:t4t/data/post_min_data.dart';
import 'package:t4t/design_system/system_sheet.dart';
import 'package:t4t/pages/view_post_page.dart';

class ViewPostSheet {
  ViewPostSheet();

  void show(BuildContext context, PostMinData post) {
    SystemSheet.show(
        noBottomSafeArea: true,
        context: context,
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ViewPostPage(
              post: post,
            )));
  }
}
