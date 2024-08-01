import 'package:supabase_flutter/supabase_flutter.dart';

class MessagesRepository {
  MessagesRepository._();

  static Future<void> sendRead(int messageId) async {
    return Supabase.instance.client
        .from('messages')
        .update({'read': true}).eq('id', messageId);
  }

  static Future<void> sendReads(String conversationId) async {
    return Supabase.instance.client
        .from('messages')
        .update({'read': true}).eq('conversation_id', conversationId);
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
