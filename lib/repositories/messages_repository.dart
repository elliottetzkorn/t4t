import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/constants.dart';

class MessagesRepository {
  MessagesRepository._();

  static Future<List<Map<String, dynamic>>> fetch(String conversationId) async {
    return Supabase.instance.client
        .from('messages')
        .select('*')
        .eq('conversation_id', conversationId)
        .limit(fetchQty)
        .order('created_at', ascending: false);
  }

  static Future<List<Map<String, dynamic>>> fetchBeforeDateTime(
      String conversationId, DateTime time) async {
    return Supabase.instance.client
        .from('messages')
        .select('*')
        .eq('conversation_id', conversationId)
        .lt('created_at', time)
        .limit(fetchQty)
        .order('created_at', ascending: false);
  }

  static Future<Map<String, dynamic>> isRead(int messageId) async {
    return Supabase.instance.client
        .from('messages')
        .select('read')
        .eq('id', messageId)
        .limit(1)
        .single();
  }

  static Future<void> sendRead(int messageId) async {
    return Supabase.instance.client
        .from('messages')
        .update({'read': true}).eq('id', messageId);
  }

  static Future<void> delete(int messageId) async {
    return Supabase.instance.client
        .from('messages')
        .delete()
        .eq('id', messageId);
  }

  static Future<List<dynamic>> adminFetch(
      String senderId, String receiverId) async {
    return Supabase.instance.client.rpc('recent_reported_messages',
        params: {'sender_id_input': senderId, 'receiver_id_input': receiverId});
  }
}
