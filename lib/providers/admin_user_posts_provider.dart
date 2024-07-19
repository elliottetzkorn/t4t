import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/data/post_data.dart';
import 'package:t4t/repositories/profile_posts_repository.dart';

part 'admin_user_posts_provider.g.dart';

@riverpod
class AdminUserPosts extends _$AdminUserPosts {
  @override
  Future<List<PostData>> build(String pid) async {
    final response = await ProfilePostsRepository.adminFetch(pid);

    return response.map<PostData>((data) => PostData.fromMap(data)).toList();
  }
}
