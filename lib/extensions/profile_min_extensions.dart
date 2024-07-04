import 'package:t4t/data/profile_min_data.dart';
import 'package:t4t/extensions/strings_extensions.dart';

extension StringParsing on ProfileMinData {
  String decoratedUsername() {
    if (id.isEllId()) {
      return '🌱@$username';
    } else if (supporter) {
      return '✨@$username';
    } else {
      return '@$username';
    }
  }
}
