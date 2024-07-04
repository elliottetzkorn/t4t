import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:t4t/data/post_data.dart';

class UserPostData {
  UserPostData({required this.post, required this.likeCount});

  PostData post;
  int? likeCount;

  UserPostData.fromMap(Map<String, dynamic> map)
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
                    endDate: DateTime.parse(map['date'])
                        .add(const Duration(hours: 1)))
                : null),
        likeCount = map['like_count'];
}
