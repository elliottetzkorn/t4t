import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/constants.dart';

class PostsAuthenticatedRepository {
  PostsAuthenticatedRepository._();

  static Future<List<Map<String, dynamic>>> fetch(
      String pid,
      int distance,
      List<int> badges,
      int minAge,
      int maxAge,
      int type,
      List<String> words) async {
    return Supabase.instance.client.rpc('posts_authenticated_scroll7', params: {
      'distance': valueToDistance[distance],
      'badge_ids': badges,
      'min_age': minAge,
      'max_age': maxAge,
      'num': fetchQty,
      'last_post_time': null,
      'post_type': type,
      'words': words
    });
  }

  static Future<List<Map<String, dynamic>>> fetchBeforeDateTime(
      String pid,
      int distance,
      List<int> badges,
      int minAge,
      int maxAge,
      int type,
      DateTime time,
      List<String> words) async {
    return Supabase.instance.client.rpc('posts_authenticated_scroll7', params: {
      'distance': valueToDistance[distance],
      'badge_ids': badges,
      'min_age': minAge,
      'max_age': maxAge,
      'num': fetchQty,
      'last_post_time': time.toIso8601String(),
      'post_type': type,
      'words': words
    });
  }

  static Future<List<Map<String, dynamic>>> fetchAfterDateTime(
      String pid,
      int distance,
      List<int> badges,
      int minAge,
      int maxAge,
      int type,
      DateTime time,
      List<String> words) async {
    return Supabase.instance.client.rpc('posts_authenticated_poll7', params: {
      'distance': valueToDistance[distance],
      'badge_ids': badges,
      'min_age': minAge,
      'max_age': maxAge,
      'first_post_time': time.toIso8601String(),
      'post_type': type,
      'words': words
    });
  }
}
