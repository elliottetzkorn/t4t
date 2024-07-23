import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/data/feed_data.dart';
import 'package:t4t/providers/filters/filters_provider.dart';
import 'package:t4t/repositories/posts_unauthenticated_repository.dart';

part 'posts_unauthenticated_provider.g.dart';

@riverpod
class PostsUnauthenticated extends _$PostsUnauthenticated {
  bool _isPolling = false;

  @override
  Future<List<FeedData>> build() async {
    final filters = ref.watch(filtersProvider);

    final response = await PostsUnauthenticatedRepository.fetch(filters.badges,
        filters.minAge, filters.maxAge, filters.type, filters.words);

    return response.map<FeedData>((data) => FeedData.fromMap(data)).toList();
  }

  Future<void> scroll() async {
    final filters = ref.read(filtersProvider);

    final posts = await future;

    if (posts.isNotEmpty) {
      final response = await PostsUnauthenticatedRepository.fetchBeforeDateTime(
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

  Future<void> poll() async {
    if (_isPolling) {
      return;
    }

    _isPolling = true;

    final filters = ref.read(filtersProvider);

    final posts = await future;

    if (posts.isNotEmpty) {
      final response = await PostsUnauthenticatedRepository.fetchAfterDateTime(
          filters.badges,
          filters.minAge,
          filters.maxAge,
          filters.type,
          posts.first.post.createdAt,
          filters.words);

      posts.insertAll(
          0, response.map<FeedData>((data) => FeedData.fromMap(data)));

      state = AsyncData(posts);
    }

    _isPolling = false;
  }
}
