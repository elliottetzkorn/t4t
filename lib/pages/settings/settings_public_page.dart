import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:t4t/components/save_button.dart';
import 'package:t4t/components/switch_cell.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/design_system/system_action_page.dart';
import 'package:t4t/providers/profile_provider.dart';

class SettingsPublicPage extends ConsumerStatefulWidget {
  const SettingsPublicPage({super.key, required this.profile});

  final ProfileData profile;

  @override
  ConsumerState<SettingsPublicPage> createState() => _SettingsPublicPageState();
}

class _SettingsPublicPageState extends ConsumerState<SettingsPublicPage> {
  var _saving = false;
  late bool _public;

  @override
  void initState() {
    super.initState();
    _public = widget.profile.public;
  }

  Future<void> _updateProfile() async {
    setState(() => _saving = true);

    await ref.read(profileProvider.notifier).updatePublic(_public).then((_) {
      context.pop();
    });

    setState(() => _saving = false);
  }

  @override
  Widget build(BuildContext context) {
    return SystemActionPage(
        body: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SwitchCell(
                title: _public
                    ? AppLocalizations.of(context)!.public
                    : AppLocalizations.of(context)!.protected,
                subTitle: _public
                    ? AppLocalizations.of(context)!.public_subtitle
                    : AppLocalizations.of(context)!.protected_subtitle,
                switchValue: _public,
                onPressed: () {
                  setState(() {
                    _public = !_public;
                  });
                },
              ),
            ]),
        action: SaveButton(
          saving: _saving,
          onPressed: _updateProfile,
          enabled: _public != widget.profile.public,
        ));
  }
}
