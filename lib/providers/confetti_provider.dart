import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/data/confetti_data.dart';

part 'confetti_provider.g.dart';

@riverpod
class Confetti extends _$Confetti {
  @override
  ConfettiData? build() {
    ref.keepAlive();
    return null;
  }

  void showConfetti(ConfettiData source) {
    state = source.copyWith();
  }

  void resetConfetti() {
    state = null;
  }
}
