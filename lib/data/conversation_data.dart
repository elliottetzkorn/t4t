import 'package:t4t/data/profile_min_data.dart';
import 'package:t4t/extensions/color_extensions.dart';

class ConversationData {
  ConversationData(
      {required this.profile,
      required this.text,
      required this.unread,
      required this.lastMessageCreatedAt});

  final ProfileMinData profile;
  String text;
  bool unread;
  DateTime lastMessageCreatedAt;

  ConversationData.fromMap({required Map<dynamic, dynamic> map})
      : profile = ProfileMinData(
          id: map['profile_id'],
          color: ColorParsing.fromHex(map['profile_color']),
          username: map['profile_username'],
          supporter: map['supporter'],
        ),
        text = map['message'],
        lastMessageCreatedAt = DateTime.parse(map['created_at']),
        unread = map['unread'];
}
