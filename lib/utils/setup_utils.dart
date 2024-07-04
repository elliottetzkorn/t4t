import 'package:t4t/constants.dart';

class SetupUtils {
  SetupUtils._();

  static String? oauthUsername;

  static void setOauthUsername(String? tempUsername) {
    if (tempUsername != null) {
      String usernameLong = tempUsername.split('@')[0];

      if (usernameLong.length >= usernameLength) {
        oauthUsername = usernameLong.substring(0, usernameLength);
      } else {
        oauthUsername = usernameLong;
      }
    }
  }
}
