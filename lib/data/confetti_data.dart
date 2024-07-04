import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:t4t/design_system/system_confetti.dart';

part 'confetti_data.freezed.dart';

@freezed
class ConfettiData with _$ConfettiData {
  const factory ConfettiData({required DwellingConfettiSource source}) =
      _ConfettiData;
}
