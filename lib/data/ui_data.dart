import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_data.freezed.dart';

@freezed
class UIData with _$UIData {
  const factory UIData(
      {required bool onboardingConfetti,
      required bool supporterConfetti}) = _UIData;
}
