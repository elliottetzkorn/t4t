// ignore_for_file: empty_catches
import 'dart:async';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart' as apple_auth;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/constants.dart';
import 'dart:convert';
import 'package:t4t/design_system/system_login_button.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/providers/simple_font_provider.dart';
import 'package:t4t/utils/setup_utils.dart';
import 'package:t4t/utils/store_config.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool _isLoadingApple = false;
  bool _isLoadingGoogle = false;
  bool contactsEnabled = false;

  Future<void> signInWithApple() async {
    setState(() {
      _isLoadingApple = true;
    });

    context.pop();

    try {
      if (Platform.isIOS || Platform.isMacOS) {
        final rawNonce = Supabase.instance.client.auth.generateRawNonce();
        final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();
        final credential =
            await apple_auth.SignInWithApple.getAppleIDCredential(
          scopes: [apple_auth.AppleIDAuthorizationScopes.email],
          nonce: hashedNonce,
        );
        final idToken = credential.identityToken;
        if (idToken == null) {
          throw const AuthException(
              'Could not find ID Token from generated credential.');
        }

        await Supabase.instance.client.auth
            .signInWithIdToken(
          provider: OAuthProvider.apple,
          idToken: idToken,
          nonce: rawNonce,
        )
            .then((value) {
          if (value.user != null) {
            Purchases.configure(
                PurchasesConfiguration(StoreConfig.instance.apiKey)
                  ..appUserID = value.user!.id);
            SetupUtils.setOauthUsername(value.user!.email!);
          }
        });
      } else {
        await Supabase.instance.client.auth.signInWithOAuth(OAuthProvider.apple,
            redirectTo: 'io.supabase.t4t://login-callback/');
      }
    } catch (e) {}
  }

  Future<void> signInWithGoogle() async {
    setState(() {
      _isLoadingGoogle = true;
    });

    context.pop();

    try {
      final GoogleSignIn googleSignIn;

      googleSignIn = GoogleSignIn(
        clientId: dotenv.env['FIREBASE_IOS_CLIENT_ID']!,
        serverClientId: dotenv.env['FIREBASE_WEB_CLIENT_ID']!,
      );

      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }

      await Supabase.instance.client.auth
          .signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      )
          .then((value) {
        if (value.user != null) {
          Purchases.configure(
              PurchasesConfiguration(StoreConfig.instance.apiKey)
                ..appUserID = value.user!.id);
          SetupUtils.setOauthUsername(value.user!.email!);
        }
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(spacingFive),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SystemText(
                    text: AppLocalizations.of(context)!.login_header,
                    size: TextSizeEnum.eighteen),
                const SizedBox(height: spacingFour),
                RichText(
                    text: TextSpan(
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontFamily: ref.watch(simpleFontProvider)
                          ? fontSimple
                          : fontWaxWing,
                      fontSize: 10),
                  children: <TextSpan>[
                    TextSpan(
                        text: AppLocalizations.of(context)!.login_disclaimer_1),
                    TextSpan(
                        text: AppLocalizations.of(context)!
                            .login_disclaimer_terms,
                        style: const TextStyle(
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                                Uri.parse('https://www.t4t.social/terms'));
                          }),
                    TextSpan(
                      text: AppLocalizations.of(context)!.login_disclaimer_2,
                    ),
                    TextSpan(
                        text: AppLocalizations.of(context)!
                            .login_disclaimer_privacy_policy,
                        style: const TextStyle(
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                                Uri.parse('https://www.t4t.social/privacy'));
                          }),
                    TextSpan(
                        text: AppLocalizations.of(context)!.login_disclaimer_3),
                  ],
                )),
                const SizedBox(height: spacingSix),
                Column(
                    verticalDirection: Platform.isIOS || Platform.isMacOS
                        ? VerticalDirection.down
                        : VerticalDirection.up,
                    children: [
                      SystemLoginButton(
                          icon: PhosphorIcons.apple_logo_thin,
                          text: _isLoadingApple
                              ? AppLocalizations.of(context)!
                                  .login_button_logging_in
                              : AppLocalizations.of(context)!
                                  .login_button_apple,
                          onPressed: signInWithApple),
                      const SizedBox(height: spacingFive),
                      SystemLoginButton(
                          icon: PhosphorIcons.google_logo_thin,
                          text: _isLoadingGoogle
                              ? AppLocalizations.of(context)!
                                  .login_button_logging_in
                              : AppLocalizations.of(context)!
                                  .login_button_google,
                          onPressed: signInWithGoogle),
                    ]),
                const SizedBox(height: spacingSix),
              ],
            ),
          )
        ]);
  }
}
