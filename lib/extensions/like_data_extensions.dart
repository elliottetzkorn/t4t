import 'package:t4t/data/post_like_data.dart';
import 'package:t4t/data/profile_min_data.dart';

extension ProfileParsing on PostLikeData {
  ProfileMinData min() {
    return ProfileMinData(
        id: id, supporter: supporter, color: color, username: username);
  }
}
