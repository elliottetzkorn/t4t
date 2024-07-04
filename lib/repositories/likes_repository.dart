import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/constants.dart';

class LikesRepository {
  LikesRepository._();

  static Future<List<Map<String, dynamic>>> forPost(
      String pid, int postId) async {
    return Supabase.instance.client.rpc('likes_for_post_scroll3',
        params: {'post_id': postId, 'num': fetchQty, 'last_like_time': null});
  }

  static Future<List<Map<String, dynamic>>> forPostBeforeTime(
      String pid, int postId, DateTime time) async {
    return Supabase.instance.client.rpc('likes_for_post_scroll3', params: {
      'post_id': postId,
      'num': fetchQty,
      'last_like_time': time.toIso8601String()
    });
  }
}
