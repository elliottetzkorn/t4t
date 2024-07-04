import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/data/post_data.dart';
import 'package:t4t/data/user_post_data.dart';
import 'package:t4t/repositories/profile_posts_repository.dart';
part 'profile_posts_provider.g.dart';

@riverpod
class ProfilePosts extends _$ProfilePosts {
  @override
  Future<List<UserPostData>> build() async {
    final response = await ProfilePostsRepository.fetch();

    return response
        .map<UserPostData>((data) => UserPostData.fromMap(data))
        .toList();
  }

  Future<void> scroll() async {
    final profilePosts = await future;

    if (profilePosts.isNotEmpty) {
      final response = await ProfilePostsRepository.fetchBeforeDateTime(
          profilePosts.last.post.createdAt);

      if (response.isNotEmpty) {
        profilePosts.addAll(
            response.map<UserPostData>((data) => UserPostData.fromMap(data)));

        state = AsyncData(profilePosts);
      }
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
}
