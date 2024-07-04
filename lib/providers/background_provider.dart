import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'background_provider.g.dart';

@riverpod
class Background extends _$Background {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    if (state == false) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }

    state = !state;
  }
}
