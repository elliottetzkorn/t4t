class LikeMinData {
  LikeMinData({this.id, required this.likeTypeId});

  final int? id;

  final int likeTypeId;

  LikeMinData.fromMap(Map<dynamic, dynamic> map)
      : id = map['id'],
        likeTypeId = map['like_type']['id'];
}
