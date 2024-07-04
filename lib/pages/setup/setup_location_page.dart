import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/components/continue_button.dart';
import 'package:t4t/components/title_subtitle.dart';
import 'package:t4t/data/location_data.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/design_system/system_loader.dart';
import 'package:t4t/extensions/router_extensions.dart';
import 'package:t4t/pages/setup/setup_page.dart';
import 'package:t4t/providers/profile_provider.dart';
import 'package:t4t/providers/router_provider.dart';
import 'package:t4t/utils/location_utils.dart';

class SetupLocationPage extends ConsumerStatefulWidget {
  const SetupLocationPage({super.key, required this.profile});

  final ProfileData profile;

  @override
  ConsumerState<SetupLocationPage> createState() => _SetupLocationPageState();
}

class _SetupLocationPageState extends ConsumerState<SetupLocationPage> {
  bool _saving = false;

  Future<void> _getLocationAndUpdateProfile() async {
    setState(() => _saving = true);

    await LocationUtils.getLocation(context).then((value) {
      if (value != null) {
        _updateProfile(value);
      } else {
        setState(() => _saving = false);
      }
    }).catchError((error) {
      setState(() => _saving = false);
    });
  }

  Future<void> _updateProfile(LocationData location) async {
    setState(() => _saving = true);

    await ref.read(profileProvider.notifier).updateLocation(location).then((_) {
      ref.read(routerProvider).toProfileSetup(
          widget.profile.copyWith(
              neighborhood: location.neighborhoodName,
              city: location.cityName,
              state: location.stateName,
              country: location.countryName),
          ref);
    });

    setState(() => _saving = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _saving
            ? const SystemLoader()
            : SetupPage(
                profile: widget.profile,
                closable: true,
                body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleSubtitle(
                          title: AppLocalizations.of(context)!
                              .setup_location_title,
                          subTitle: AppLocalizations.of(context)!
                              .setup_location_subtitle),
                    ]),
                action: ContinueButton(
                  continueText: AppLocalizations.of(context)!.continue_button,
                  onPressed: _getLocationAndUpdateProfile,
                  enabled: true,
                )));
  }
}
