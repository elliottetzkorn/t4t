import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/components/system_brightness.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/extensions/color_theme_enum_extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/providers/router_provider.dart';
import 'package:t4t/providers/theme_provider.dart';
import 'package:t4t/utils/device_utils.dart';
import 'package:t4t/utils/store_config.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  if (Platform.isIOS || Platform.isMacOS) {
    StoreConfig(
      store: Store.appStore,
      apiKey: dotenv.env['PURCHASES_APPLE_API_KEY']!,
    );
  } else if (Platform.isAndroid) {
    StoreConfig(
      store: Store.playStore,
      apiKey: dotenv.env['PURCHASES_GOOGLE_API_KEY']!,
    );
  }

  // Add Stamen license for the watercolor map
  LicenseRegistry.addLicense(() => Stream<LicenseEntry>.value(
        const LicenseEntryWithLineBreaks(
          <String>['watercolor_map'],
          '''Map tiles by Stamen Design, under CC BY 3.0. Data by OpenStreetMap, under CC BY SA''',
        ),
      ));

  await Future.wait([
    Supabase.initialize(
        authOptions: const FlutterAuthClientOptions(autoRefreshToken: true),
        url: dotenv.env['SUPABASE_URL']!,
        anonKey: dotenv.env['SUPABASE_KEY']!),
    DeviceUtils.setIsTablet(),
    setPrefs(),
    safelyInitializeFirebase(),
    safelyInitializeFMTC()
  ]).then((_) {
    initializedMapCache();
  });

  runApp(const ProviderScope(child: SystemBrightness(child: T4T())));
}

Future<void> setPrefs() async {
  prefs = await SharedPreferences.getInstance();
}

Future<void> safelyInitializeFirebase() async {
  try {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: dotenv.env['FIREBASE_API_KEY']!,
        appId: dotenv.env['FIREBASE_APP_ID']!,
        messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
        projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
        storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
        androidClientId: dotenv.env['FIREBASE_ANDROID_CLIENT_ID']!,
        iosClientId: dotenv.env['FIREBASE_IOS_CLIENT_ID']!,
        iosBundleId: dotenv.env['FIREBASE_IOS_BUNDLE_ID']!,
      ),
    );

    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  } catch (e) {
    return;
  }
}

Future<void> initializedMapCache() async {
  try {
    await const FMTCStore(cacheWatercolor).manage.create();
  } catch (e) {
    return;
  }
}

Future<void> safelyInitializeFMTC() async {
  try {
    await FMTCObjectBoxBackend().initialise();
  } catch (e) {
    return;
  }
}

class T4T extends ConsumerWidget {
  const T4T({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
        themeMode: ref.watch(themeProvider.select((value) => value.mode)),
        theme:
            ref.watch(themeProvider.select((value) => value.lightTheme)).data(),
        darkTheme:
            ref.watch(themeProvider.select((value) => value.darkTheme)).data(),
        routerConfig: ref.watch(routerProvider),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false);
  }
}
