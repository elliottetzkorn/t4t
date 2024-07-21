import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/data/feed_data.dart';
import 'package:t4t/data/like_min_data.dart';
import 'package:t4t/data/post_data.dart';
import 'package:t4t/enums/sub_pages_enum.dart';
import 'package:t4t/providers/filters/filters_provider.dart';
import 'package:t4t/providers/profile_provider.dart';
import 'package:t4t/providers/tab_provider.dart';
import 'package:t4t/repositories/posts_authenticated_repository.dart';

part 'posts_authenticated_provider.g.dart';

@riverpod
class PostsAuthenticated extends _$PostsAuthenticated {
  bool _isPolling = false;

  @override
  Future<List<FeedData>> build() async {
    final filters = ref.watch(filtersProvider);
    final id = await ref.read(profileProvider.selectAsync((data) => data.id));

    final response = await PostsAuthenticatedRepository.fetch(
        id,
        filters.distance,
        filters.badges,
        filters.minAge,
        filters.maxAge,
        filters.type,
        filters.words);

    return response.map<FeedData>((data) => FeedData.fromMap(data)).toList();
  }

  Future<void> scroll() async {
    final filters = ref.read(filtersProvider);
    final id = await ref.read(profileProvider.selectAsync((data) => data.id));

    final posts = await future;

    if (posts.isNotEmpty) {
      final response = await PostsAuthenticatedRepository.fetchBeforeDateTime(
          id,
          filters.distance,
          filters.badges,
          filters.minAge,
          filters.maxAge,
          filters.type,
          posts.last.post.createdAt,
          filters.words);

      if (response.isNotEmpty) {
        posts.addAll(response.map<FeedData>((data) => FeedData.fromMap(data)));

        state = AsyncData(posts);
      }
    }
  }

  Future<void> poll(bool initial) async {
    if (_isPolling) {
      return;
    }

    _isPolling = true;

    final filters = ref.read(filtersProvider);
    final tab = ref.read(tabProvider);
    final id = await ref.read(profileProvider.selectAsync((data) => data.id));

    if (initial || tab != SubPagesEnum.posts) {
      final posts = await future;

      if (posts.isNotEmpty) {
        final response = await PostsAuthenticatedRepository.fetchAfterDateTime(
            id,
            filters.distance,
            filters.badges,
            filters.minAge,
            filters.maxAge,
            filters.type,
            posts.first.post.createdAt,
            filters.words);

        if (response.isNotEmpty) {
          posts.insertAll(
              0, response.map<FeedData>((data) => FeedData.fromMap(data)));

          state = AsyncData(posts);
        }
      } else {
        ref.invalidateSelf();
      }
    }

    _isPolling = false;
  }

  Future<void> setSupporter(bool supporter) async {
    final posts = await future;
    bool refreshRequired = false;

    for (FeedData post in posts) {
      if (post.profile.id ==
          Supabase.instance.client.auth.currentSession!.user.id) {
        post.profile = post.profile.copyWith(supporter: supporter);
        refreshRequired = true;
      }
    }

    if (refreshRequired) {
      state = AsyncData(posts);
    }
  }

  Future<void> updatePost(PostData newPost) async {
    final posts = await future;

    posts.firstWhere((post) => post.post.id == newPost.id).post = newPost;

    state = AsyncData(posts);
  }

  Future<void> removePost(int postId) async {
    final posts = await future;

    posts.removeWhere((post) => post.post.id == postId);

    state = AsyncData(posts);
  }

  Future<void> removeBlockedUser(String profileId) async {
    final posts = await future;

    posts.removeWhere((post) => post.profile.id == profileId);

    state = AsyncData(posts);
  }

  Future<void> addLike(LikeMinData likeData, int postId) async {
    final posts = await future;

    if (posts.any((post) => post.post.id == postId)) {
      posts.firstWhere((post) => post.post.id == postId).like = likeData;

      state = AsyncData(posts);
    }
  }

  Future<void> removeLike(int postId) async {
    final posts = await future;

    if (posts.any((post) => post.post.id == postId)) {
      posts.firstWhere((post) => post.post.id == postId).like = null;

      state = AsyncData(posts);
    }
  }
}
