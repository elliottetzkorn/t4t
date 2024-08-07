import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilesRepository {
  ProfilesRepository._();

  static Future<Map<String, dynamic>> fetch(String userName) async {
    return Supabase.instance.client
        .from('profiles')
        .select('id, username, supporter, color')
        .eq('username', userName)
        .limit(1)
        .single();
  }
}
