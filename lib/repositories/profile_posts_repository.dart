import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/constants.dart';

class ProfilePostsRepository {
  ProfilePostsRepository._();

  static Future<List<Map<String, dynamic>>> fetch() async {
    return Supabase.instance.client
        .rpc('user_posts3', params: {'num': fetchQty, 'last_post_time': null});
  }

  static Future<List<Map<String, dynamic>>> fetchBeforeDateTime(
      DateTime time) async {
    return Supabase.instance.client.rpc('user_posts3',
        params: {'num': fetchQty, 'last_post_time': time.toIso8601String()});
  }

  static Future<List<Map<String, dynamic>>> adminFetch(String pid) async {
    return Supabase.instance.client
        .rpc('recent_reported_posts', params: {'pid': pid});
  }
}
