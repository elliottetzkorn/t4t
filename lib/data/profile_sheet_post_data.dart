import 'package:t4t/data/like_min_data.dart';
import 'package:t4t/data/post_data.dart';

class ProfileSheetPostData {
  ProfileSheetPostData({required this.post, required this.like});

  final PostData post;
  LikeMinData? like;

  ProfileSheetPostData.fromMap(Map<dynamic, dynamic> map)
      : post = PostData.fromMap(map),
        like = map['likes'] == null || map['likes'].length == 0
            ? null
            : LikeMinData.fromMap(map['likes'][0]);
}
