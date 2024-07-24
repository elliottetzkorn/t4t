import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/constants.dart';

class NotificationsRepository {
  NotificationsRepository._();

  static Future<List<Map<String, dynamic>>> fetch() async {
    return Supabase.instance.client.rpc('notifications_scroll5',
        params: {'num': fetchQty, 'last_notif_time': null});
  }

  static Future<List<Map<String, dynamic>>> fetchBeforeDateTime(
      DateTime time) async {
    return Supabase.instance.client.rpc('notifications_scroll5',
        params: {'num': fetchQty, 'last_notif_time': time.toIso8601String()});
  }

  static Future<List<Map<String, dynamic>>> fetchAfterDateTime(
      DateTime time) async {
    return Supabase.instance.client.rpc('notifications_poll5',
        params: {'first_notif_time': time.toIso8601String()});
  }
}
