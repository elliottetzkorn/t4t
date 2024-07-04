class PostMinData {
  PostMinData({this.id, required this.title, required this.body});

  final int? id;
  String title;
  final String body;

  PostMinData.fromMap(Map<dynamic, dynamic> map)
      : id = map['id'],
        title = map['title'],
        body = map['body'];
}
