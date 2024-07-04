import 'package:url_launcher/url_launcher.dart';

class SocialUtils {
  SocialUtils._();

  static void goToGithub() {
    launchUrl(Uri.parse('https://github.com/elliottetzkorn/t4t'),
        mode: LaunchMode.externalApplication);
  }
}
