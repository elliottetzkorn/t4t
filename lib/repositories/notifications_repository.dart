import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/constants.dart';

class NotificationsRepository {
  NotificationsRepository._();

  static Future<List<Map<String, dynamic>>> fetch() async {
    return Supabase.instance.client.rpc('notifications_scroll6',
        params: {'user_id': userId, 'num': fetchQty, 'last_notif_time': null});
  }

  static Future<List<Map<String, dynamic>>> fetchBeforeDateTime(
      DateTime time) async {
    return Supabase.instance.client.rpc('notifications_scroll6', params: {
      'user_id': userId,
      'num': fetchQty,
      'last_notif_time': time.toIso8601String()
    });
  }

  static Future<List<Map<String, dynamic>>> fetchAfterDateTime(
      DateTime time) async {
    return Supabase.instance.client.rpc('notifications_poll6', params: {
      'user_id': userId,
      'first_notif_time': time.toIso8601String()
    });
  }
}
