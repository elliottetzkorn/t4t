import 'package:flutter/material.dart';
import 'package:t4t/components/post_min_cell.dart';
import 'package:t4t/data/post_min_data.dart';
import 'package:t4t/constants.dart';

class ViewPostPage extends StatelessWidget {
  const ViewPostPage({super.key, required this.post});

  final PostMinData post;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: spacingFive,
          left: spacingFive,
          right: spacingFive,
          bottom: MediaQuery.of(context).padding.bottom + spacingFive,
        ),
        child: PostMinCell(
          post: post,
        ));
  }
}
