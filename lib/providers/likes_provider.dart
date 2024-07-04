import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/data/post_like_data.dart';
import 'package:t4t/providers/profile_provider.dart';
import 'package:t4t/repositories/likes_repository.dart';

part 'likes_provider.g.dart';

@riverpod
class Likes extends _$Likes {
  @override
  Future<List<PostLikeData>> build(int postId) async {
    final id = await ref.read(profileProvider.selectAsync((data) => data.id));
    try {
      final response = await LikesRepository.forPost(id, postId);

      return response
          .map<PostLikeData>((data) => PostLikeData.fromJson(data))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> scroll() async {
    final likes = await future;
    final id = await ref.read(profileProvider.selectAsync((data) => data.id));

    final response = await LikesRepository.forPostBeforeTime(
        id, postId, likes.last.createdAt);

    likes.addAll(
        response.map<PostLikeData>((data) => PostLikeData.fromJson(data)));

    state = AsyncData(likes);
  }
}
