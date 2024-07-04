import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:t4t/data/confetti_data.dart';
import 'package:t4t/design_system/system_confetti.dart';
import 'package:t4t/design_system/system_dialog.dart';
import 'package:t4t/providers/confetti_provider.dart';
import 'package:t4t/providers/posts_authenticated_provider.dart';
import 'package:t4t/providers/profile_provider.dart';
import 'package:t4t/providers/subscribing_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SupporterUtils {
  SupporterUtils._();

  static Future<void> attemptPurchase(
      BuildContext context, WidgetRef ref) async {
    ref.read(subscribingProvider.notifier).setSubscribing(true);
    try {
      await Purchases.getOfferings().then((value) {
        purchase(context, value.current!.availablePackages.first, ref);
      });
    } on PlatformException catch (_) {
      ref.read(subscribingProvider.notifier).setSubscribing(false);
    }
  }

  static Future<void> purchase(
      BuildContext context, Package package, WidgetRef ref) async {
    try {
      await Purchases.purchasePackage(package).then((customerInfo) {
        updateSupporterStatus(context, customerInfo, ref);
      });
    } catch (_) {
      ref.read(subscribingProvider.notifier).setSubscribing(false);
    }
  }

  static Future<void> updateSupporterStatus(
      BuildContext context, CustomerInfo customerInfo, WidgetRef ref) async {
    bool isSupporter = customerInfo.activeSubscriptions.isNotEmpty;

    ref.read(profileProvider.notifier).updateSupporter(isSupporter);

    if (isSupporter) {
      ref.read(confettiProvider.notifier).showConfetti(
          const ConfettiData(source: DwellingConfettiSource.supporter));
      ref.read(postsAuthenticatedProvider.notifier).setSupporter(true);

      SupporterUtils.thankYou(context);
    }

    ref.read(subscribingProvider.notifier).setSubscribing(false);
  }

  static Future<void> restorePurchase(
      BuildContext context, WidgetRef ref) async {
    ref.read(subscribingProvider.notifier).setSubscribing(true);

    try {
      await Purchases.restorePurchases().then((customerInfo) {
        bool isSupporter = customerInfo.activeSubscriptions.isNotEmpty;
        ref.read(profileProvider.notifier).updateSupporter(isSupporter);

        ref.read(subscribingProvider.notifier).setSubscribing(false);

        if (isSupporter) {
          SupporterUtils.subscriptionRestored(context);
        } else {
          SupporterUtils.noSubscription(context);
        }
      });
    } catch (_) {
      ref.read(subscribingProvider.notifier).setSubscribing(false);

      // ignore: use_build_context_synchronously
      SupporterUtils.noSubscription(context);
    }
  }

  static void goToSubscriptions() {
    launchUrl(
        Uri.parse(Platform.isIOS || Platform.isMacOS
            ? 'itms-apps://apps.apple.com/account/subscriptions'
            : 'https://play.google.com/store/account/subscriptions'),
        mode: LaunchMode.externalApplication);
  }

  static void viewEula() {
    launchUrl(Uri.parse('https://t4t.social/eula'),
        mode: LaunchMode.platformDefault);
  }

  static Future<void> thankYou(BuildContext context) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SystemDialog(
            subTitle: AppLocalizations.of(context)!.thank_you,
            children: const [],
          );
        });
  }

  static Future<void> noSubscription(BuildContext context) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SystemDialog(
            subTitle:
                AppLocalizations.of(context)!.subscription_restored_failed,
            children: const [],
          );
        });
  }

  static Future<void> subscriptionRestored(BuildContext context) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SystemDialog(
            subTitle: AppLocalizations.of(context)!.subscription_restored,
            children: const [],
          );
        });
  }
}
