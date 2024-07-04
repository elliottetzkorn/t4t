import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/constants.dart';

class PostsUnauthenticatedRepository {
  PostsUnauthenticatedRepository._();

  static Future<List<Map<String, dynamic>>> fetch(
      List<int> badges, int minAge, int maxAge, int type) async {
    return Supabase.instance.client
        .rpc('posts_unauthenticated_scroll5', params: {
      'badge_ids': badges,
      'min_age': minAge,
      'max_age': maxAge,
      'num': fetchQty,
      'last_post_time': null,
      'post_type': type
    });
  }

  static Future<List<Map<String, dynamic>>> fetchBeforeDateTime(
      List<int> badges, int minAge, int maxAge, int type, DateTime time) async {
    return Supabase.instance.client
        .rpc('posts_unauthenticated_scroll5', params: {
      'badge_ids': badges,
      'min_age': minAge,
      'max_age': maxAge,
      'num': fetchQty,
      'last_post_time': time.toIso8601String(),
      'post_type': type
    });
  }

  static Future<List<Map<String, dynamic>>> fetchAfterDateTime(
      List<int> badges, int minAge, int maxAge, int type, DateTime time) async {
    return Supabase.instance.client.rpc('posts_unauthenticated_poll5', params: {
      'badge_ids': badges,
      'min_age': minAge,
      'max_age': maxAge,
      'first_post_time': time.toIso8601String(),
      'post_type': type
    });
  }
}
