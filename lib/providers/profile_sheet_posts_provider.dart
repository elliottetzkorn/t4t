import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/data/like_min_data.dart';
import 'package:t4t/data/profile_sheet_post_data.dart';
import 'package:t4t/providers/profile_provider.dart';
import 'package:t4t/repositories/profile_sheet_posts_repository.dart';

part 'profile_sheet_posts_provider.g.dart';

@riverpod
class ProfileSheetPosts extends _$ProfileSheetPosts {
  @override
  Future<List<ProfileSheetPostData>> build(
      String profileId, bool authenticated) async {
    late final List<Map<String, dynamic>> response;

    if (authenticated) {
      final id = await ref.read(profileProvider.selectAsync((data) => data.id));
      response =
          await ProfileSheetPostsRepository.fetchAuthenticated(id, profileId);
    } else {
      response =
          await ProfileSheetPostsRepository.fetchUnauthenticated(profileId);
    }

    return response
        .map<ProfileSheetPostData>((data) => ProfileSheetPostData.fromMap(data))
        .toList();
  }

  Future<void> scroll(String profileId, bool authenticated) async {
    final profilePosts = await future;

    if (profilePosts.isNotEmpty) {
      late final List<Map<String, dynamic>> response;

      if (authenticated) {
        final id =
            await ref.read(profileProvider.selectAsync((data) => data.id));
        response =
            await ProfileSheetPostsRepository.fetchBeforeDateTimeAuthenticated(
                id, profileId, profilePosts.last.post.createdAt);
      } else {
        response = await ProfileSheetPostsRepository
            .fetchBeforeDateTimeUnauthenticated(
                profileId, profilePosts.last.post.createdAt);
      }

      if (response.isNotEmpty) {
        profilePosts.addAll(response.map<ProfileSheetPostData>(
            (data) => ProfileSheetPostData.fromMap(data)));

        state = AsyncData(profilePosts);
      }
    }
  }

  Future<void> addLike(LikeMinData likeData, int postId) async {
    final profileSheetPosts = await future;

    if (profileSheetPosts.any((post) => post.post.id == postId)) {
      profileSheetPosts.firstWhere((post) => post.post.id == postId).like =
          likeData;

      state = AsyncData(profileSheetPosts);
    }
  }

  Future<void> removeLike(int postId) async {
    final profileSheetPosts = await future;

    if (profileSheetPosts.any((post) => post.post.id == postId)) {
      profileSheetPosts.firstWhere((post) => post.post.id == postId).like =
          null;

      state = AsyncData(profileSheetPosts);
    }
  }
}
