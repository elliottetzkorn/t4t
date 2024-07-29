import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/constants.dart';

class ConversationsRepository {
  ConversationsRepository._();

  static Future<List<Map<String, dynamic>>> fetch() async {
    return Supabase.instance.client.rpc('conversations_scroll6', params: {
      'user_id': userId,
      'num': fetchQty,
      'last_conversation_time': null
    });
  }

  static Future<List<Map<String, dynamic>>> fetchBeforeDateTime(
      DateTime time) async {
    return Supabase.instance.client.rpc('conversations_scroll6', params: {
      'user_id': userId,
      'num': fetchQty,
      'last_conversation_time': time.toIso8601String()
    });
  }

  static Future<List<Map<String, dynamic>>> fetchAfterDateTime(
      DateTime time) async {
    return Supabase.instance.client.rpc('conversations_poll6', params: {
      'user_id': userId,
      'first_conversation_time': time.toIso8601String(),
    });
  }

  static Future<dynamic> delete(String profileId) async {
    return Supabase.instance.client.from('messages').delete().or(
        'and(sender_id.eq.$profileId,receiver_id.eq.$userId),and(receiver_id.eq.$profileId,sender_id.eq.$userId)');
  }
}
