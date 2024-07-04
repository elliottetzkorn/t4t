import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/design_system/system_dialog.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/design_system/system_text_button.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/providers/filters/filters_distance_selection_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:t4t/providers/profile_provider.dart';
import 'package:t4t/providers/router_provider.dart';

class DistanceSelector extends ConsumerWidget {
  const DistanceSelector({super.key});

  Future<void> showNoLocationDialog(BuildContext context, WidgetRef ref) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SystemDialog(
          subTitle: AppLocalizations.of(context)!.location_filtering_body,
          children: <Widget>[
            SystemTextButton(
                text: AppLocalizations.of(context)!.no,
                onPressed: () {
                  context.pop();
                }),
            SystemTextButton(
              text: AppLocalizations.of(context)!.yes,
              onPressed: () {
                ProfileData? profile = ref.read(profileProvider).value;
                if (profile != null) {
                  context.pop();
                  context.pop();
                  ref
                      .read(routerProvider)
                      .replaceNamed(routeSetupLocation, extra: profile);
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final distance = ref.watch(filtersDistanceSelectionProvider);

    return Column(children: [
      Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SystemText(
                text: AppLocalizations.of(context)!.distance,
                size: TextSizeEnum.eighteen),
            SystemText(
              text: distance == maxDistanceKey
                  ? AppLocalizations.of(context)!.everywhere_small
                  : distance == minDistanceKey
                      ? AppLocalizations.of(context)!.nearby
                      : '${valueToDistance[distance]} mi',
            )
          ]),
      Slider(
        inactiveColor: Theme.of(context).colorScheme.tertiary,
        min: minDistanceKey.toDouble(),
        max: maxDistanceKey.toDouble(),
        value: distance.toDouble(),
        onChanged: (double value) {
          if (ref.read(profileProvider).value?.country == null) {
            showNoLocationDialog(context, ref);
          } else {
            ref
                .read(filtersDistanceSelectionProvider.notifier)
                .change(value.toInt());
          }
        },
      ),
    ]);
  }
}
