import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:t4t/enums/sub_pages_enum.dart';

extension IntParsing on SubPagesEnum {
  int index() {
    switch (this) {
      case SubPagesEnum.posts:
        return 0;
      case SubPagesEnum.conversations:
        return 1;
      case SubPagesEnum.notifications:
        return 2;
      case SubPagesEnum.profile:
        return 3;
    }
  }
}

extension IconParsing on SubPagesEnum {
  IconData icon() {
    switch (this) {
      case SubPagesEnum.posts:
        return PhosphorIcons.article_thin;
      case SubPagesEnum.conversations:
        return PhosphorIcons.chats_thin;
      case SubPagesEnum.notifications:
        return PhosphorIcons.spiral_thin;
      case SubPagesEnum.profile:
        return PhosphorIcons.user_thin;
    }
  }

  IconData iconFilled() {
    switch (this) {
      case SubPagesEnum.posts:
        return PhosphorIcons.article_fill;
      case SubPagesEnum.conversations:
        return PhosphorIcons.chats_fill;
      case SubPagesEnum.notifications:
        return PhosphorIcons.spiral_fill;
      case SubPagesEnum.profile:
        return PhosphorIcons.user_fill;
    }
  }
}
