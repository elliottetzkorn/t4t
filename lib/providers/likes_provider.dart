import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/data/post_like_data.dart';
import 'package:t4t/repositories/likes_repository.dart';

part 'likes_provider.g.dart';

@riverpod
class Likes extends _$Likes {
  @override
  Future<List<PostLikeData>> build(int postId) async {
    try {
      final response = await LikesRepository.forPost(postId);

      return response
          .map<PostLikeData>((data) => PostLikeData.fromJson(data))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> scroll() async {
    final likes = await future;

    final response =
        await LikesRepository.forPostBeforeTime(postId, likes.last.createdAt);

    likes.addAll(
        response.map<PostLikeData>((data) => PostLikeData.fromJson(data)));

    state = AsyncData(likes);
  }
}
