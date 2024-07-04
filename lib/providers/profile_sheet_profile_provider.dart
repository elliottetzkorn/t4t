import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/repositories/profile_sheet_profile_repository.dart';

part 'profile_sheet_profile_provider.g.dart';

@riverpod
Future<ProfileData> profileSheetProfile(
  ProfileSheetProfileRef ref,
  String profileId,
) async {
  final response = await ProfileSheetProfileRepository.fetch(profileId);

  return ProfileData.fromJson(response);
}
