import 'package:add_2_calendar/add_2_calendar.dart';

class PostData {
  PostData(
      {required this.id,
      required this.title,
      required this.body,
      required this.createdAt,
      required this.postTypeId,
      this.event,
      this.lat,
      this.lon});

  final int id;
  String title;
  String body;
  int postTypeId;
  Event? event;
  double? lat;
  double? lon;
  String? address;

  final DateTime createdAt;

  PostData.fromMap(Map<dynamic, dynamic> map)
      : id = map['id'],
        title = map['title'],
        body = map['body'],
        postTypeId = map['post_type_id'],
        lat = map['lat'],
        lon = map['lon'],
        event = map['post_type_id'] == 3 &&
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
        createdAt = DateTime.parse(map['created_at']);
}
