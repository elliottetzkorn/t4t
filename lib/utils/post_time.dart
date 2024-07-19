import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/constants.dart';

class PostTime {
  PostTime._();

  static void setLastPostTime() {
    prefs.setString(
        prefsLastPostTime +
            Supabase.instance.client.auth.currentSession!.user.id,
        DateTime.now().toString());
  }

  static bool canPost() {
    return timeSinceLastPostFromSelf().inMinutes >= postingTimeLimitMinutes;
  }

  static Duration timeSinceLastPostFromSelf() {
    String? timeString = prefs.getString(prefsLastPostTime +
        Supabase.instance.client.auth.currentSession!.user.id);

    if (timeString == null) {
      return const Duration(minutes: postingTimeLimitMinutes + 1);
    }

    return DateTime.now().difference(DateTime.parse(timeString));
  }
}
