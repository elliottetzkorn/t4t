import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t4t/repositories/messages_repository.dart';

part 'admin_user_messages_provider.g.dart';

@riverpod
class AdminUserMessages extends _$AdminUserMessages {
  @override
  Future<List<String>> build(String senderId, String receiverId) async {
    final data = await MessagesRepository.adminFetch(senderId, receiverId);

    return data.map<String>((data) => data.toString()).toList();
  }
}
