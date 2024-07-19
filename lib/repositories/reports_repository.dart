import 'package:supabase_flutter/supabase_flutter.dart';

class ReportsRepository {
  ReportsRepository._();

  static Future<List<Map<String, dynamic>>> reports() async {
    return Supabase.instance.client.rpc(
      'reports_ordered',
    );
  }
}
