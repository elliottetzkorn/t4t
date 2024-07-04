import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'subscribing_provider.g.dart';

@riverpod
class Subscribing extends _$Subscribing {
  @override
  bool build() {
    return false;
  }

  void setSubscribing(bool subscribing) {
    state = subscribing;
  }
}
