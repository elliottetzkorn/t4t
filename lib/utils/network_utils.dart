// ignore_for_file: use_build_context_synchronously
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/design_system/system_text.dart';

class NetworkUtils {
  NetworkUtils._();

  static Future<void> safeNetworkCall(BuildContext context, AsyncCallback call,
      Function postAction, VoidCallback? errorAction, bool silent) async {
    try {
      await call().then((value) {
        postAction(value);
      });
    } on PostgrestException catch (e) {
      if (errorAction != null) {
        if (!silent) showError(context, e.message);
        errorAction();
      }
    } catch (e) {
      if (errorAction != null) {
        if (!silent) showError(context, e.toString());
        errorAction();
      }
    }
  }

  static void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: SystemText(text: message, color: Colors.white),
      backgroundColor: Theme.of(context).colorScheme.error,
    ));
  }
}
