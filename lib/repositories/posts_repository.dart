import 'package:supabase_flutter/supabase_flutter.dart';

class PostsRepository {
  PostsRepository._();

  static Future<Map<String, dynamic>> fetch(int id) async {
    return Supabase.instance.client
        .from('posts')
        .select('id, title, body')
        .eq('id', id)
        .limit(1)
        .single();
  }
}
