import 'package:freezed_annotation/freezed_annotation.dart';

part 'filters_data.freezed.dart';

@freezed
class FiltersData with _$FiltersData {
  const factory FiltersData(
      {required int distance,
      required List<int> badges,
      required int type,
      required int minAge,
      required int maxAge}) = _FiltersData;
}
