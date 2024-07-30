import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/constants.dart';

class ProfileSheetProfileRepository {
  ProfileSheetProfileRepository._();

  static Future<Map<String, dynamic>> fetch(String profileId) async {
    return Supabase.instance.client.from('profiles').select('''
    *,
    badges(
      badge_type:type_id(
        id,
        text, 
        color
      )
    )
  ''').eq('id', profileId).single();
  }

  static Future<void> reportUser(String profileId) async {
    return Supabase.instance.client
        .from('reports')
        .insert({'sender_id': userId, 'receiver_id': profileId});
  }

  static Future<void> blockUser(String profileId) async {
    return Supabase.instance.client
        .from('blocks')
        .insert({'sender_id': userId, 'receiver_id': profileId});
  }
}
