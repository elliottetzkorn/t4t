import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/design_system/system_button.dart';
import 'package:t4t/providers/filters/filters_search_required_provider.dart';

class FiltersSearchButton extends ConsumerStatefulWidget {
  const FiltersSearchButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  ConsumerState<FiltersSearchButton> createState() =>
      _FiltersSearchButtonState();
}

class _FiltersSearchButtonState extends ConsumerState<FiltersSearchButton> {
  bool searching = false;

  @override
  Widget build(BuildContext context) {
    final searchRequired = ref.watch(filtersSearchRequiredProvider);
    return Center(
        child: SystemButton(
      moreImpactful: true,
      text: searching
          ? AppLocalizations.of(context)!.search_button_searching
          : searchRequired
              ? AppLocalizations.of(context)!.search_button_search
              : AppLocalizations.of(context)!.save_button_no_changes,
      enabled: searchRequired,
      onPressed: () {
        setState(() {
          searching = true;
        });
        widget.onPressed();
      },
    ));
  }
}
