import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

extension BooleanParsing on String {
  bool isEllId() {
    return this == '29366d7c-f1c4-4ce0-8be5-5a4b0a98c35a';
  }

  bool isOwnId() {
    if (Supabase.instance.client.auth.currentSession == null) {
      return false;
    } else {
      return Supabase.instance.client.auth.currentSession!.user.id == this;
    }
  }
}

extension ColorParsing on String {
  Color toColor() {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) buffer.write('ff');
    buffer.write(replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
