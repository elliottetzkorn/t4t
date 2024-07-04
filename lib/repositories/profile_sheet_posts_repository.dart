import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/constants.dart';

class ProfileSheetPostsRepository {
  ProfileSheetPostsRepository._();

  static Future<List<Map<String, dynamic>>> fetchAuthenticated(
      String pid, String profileId) async {
    return Supabase.instance.client
        .from('posts')
        .select('''
    *,
    likes!likes_post_id_fkey(
      *,
      like_type:like_type_id(
        *
      )
    )
  ''')
        .eq('likes.profile_id', pid)
        .eq('profile_id', profileId)
        .eq('deleted', false)
        .order('created_at', ascending: false)
        .limit(fetchQty);
  }

  static Future<List<Map<String, dynamic>>> fetchBeforeDateTimeAuthenticated(
      String pid, String profileId, DateTime time) async {
    return Supabase.instance.client
        .from('posts')
        .select('''
    *,
    likes!likes_post_id_fkey(
      *,
      like_type:like_type_id(
        *
      )
    )
  ''')
        .lt('created_at', time)
        .eq('likes.profile_id', pid)
        .eq('profile_id', profileId)
        .eq('deleted', false)
        .order('created_at', ascending: false)
        .limit(fetchQty);
  }

  static Future<List<Map<String, dynamic>>> fetchUnauthenticated(
      String profileId) async {
    return Supabase.instance.client
        .from('posts')
        .select('*')
        .eq('profile_id', profileId)
        .eq('deleted', false)
        .order('created_at', ascending: false)
        .limit(fetchQty);
  }

  static Future<List<Map<String, dynamic>>> fetchBeforeDateTimeUnauthenticated(
      String profileId, DateTime time) async {
    return Supabase.instance.client
        .from('posts')
        .select('*')
        .lt('created_at', time)
        .eq('profile_id', profileId)
        .eq('deleted', false)
        .order('created_at', ascending: false)
        .limit(fetchQty);
  }
}
