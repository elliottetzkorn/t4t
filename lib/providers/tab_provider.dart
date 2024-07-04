import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/enums/sub_pages_enum.dart';

part 'tab_provider.g.dart';

@riverpod
class Tab extends _$Tab {
  @override
  SubPagesEnum build() {
    return SubPagesEnum.posts;
  }

  void setTab(SubPagesEnum tab) {
    if (tab == SubPagesEnum.notifications) {

    }
    
    state = tab;
  }
}
