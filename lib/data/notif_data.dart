import 'package:t4t/data/post_min_data.dart';
import 'package:t4t/data/profile_min_data.dart';
import 'package:t4t/extensions/color_extensions.dart';

class NotifData {
  NotifData(
      {required this.profile,
      required this.post,
      required this.likeId,
      required this.likeText,
      required this.createdAt});

  final ProfileMinData profile;
  final PostMinData post;
  final int likeId;
  final String likeText;
  final DateTime createdAt;

  NotifData.fromMap(Map<dynamic, dynamic> map)
      : profile = ProfileMinData(
            id: map['profile_id'],
            color: ColorParsing.fromHex(map['profile_color']),
            username: map['profile_username'],
            supporter: map['supporter']),
        likeId = map['like_id'],
        likeText = map['like_text'],
        createdAt = DateTime.parse(map['created_at']),
        post = PostMinData(
            title: map['post_title'],
            body: map['post_body'],
            id: map['post_id']);
}
