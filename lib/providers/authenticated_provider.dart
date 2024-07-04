import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authenticated_provider.g.dart';

@riverpod
Stream<bool> authenticated(AuthenticatedRef ref) async* {
  final authStream = Supabase.instance.client.auth.onAuthStateChange;

  await for (final authState in authStream) {
    yield authState.session != null;
  }
}
