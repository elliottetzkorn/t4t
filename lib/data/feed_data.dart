import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:t4t/data/like_min_data.dart';
import 'package:t4t/data/post_data.dart';
import 'package:t4t/data/profile_min_data.dart';
import 'package:t4t/extensions/color_extensions.dart';

class FeedData {
  FeedData(
      {required this.post,
      required this.like,
      required this.profile,
      required this.likeCount});

  PostData post;
  LikeMinData? like;
  ProfileMinData profile;

  int? likeCount;

  FeedData.fromMap(Map<dynamic, dynamic> map)
      : post = PostData(
          createdAt: DateTime.parse(map['created_at']),
          title: map['title'],
          body: map['body'],
          postTypeId: map['post_type_id'],
          id: map['post_id'],
          lat: map['lat'],
          lon: map['lon'],
          event: map['post_type_id'] == 3 &&
                  map['address'] != null &&
                  map['date'] != null &&
                  map['timezone'] != null
              ? Event(
                  title: map['title'],
                  description: map['body'],
                  location: map['address'],
                  startDate: DateTime.parse(map['date']),
                  timeZone: map['timezone'],
                  endDate:
                      DateTime.parse(map['date']).add(const Duration(hours: 1)))
              : null,
        ),
        like = map['like_id'] != null && map['like_type_id'] != null
            ? LikeMinData(id: map['like_id'], likeTypeId: map['like_type_id'])
            : null,
        likeCount = map['like_count'],
        profile = ProfileMinData(
            supporter: map['supporter'],
            id: map['profile_id'],
            color: ColorParsing.fromHex(map['color']),
            username: map['username']);
}
