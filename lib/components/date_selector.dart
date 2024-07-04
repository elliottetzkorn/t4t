import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:t4t/components/save_button.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/design_system/system_action_page.dart';
import 'package:t4t/providers/simple_font_provider.dart';

class DateSelector extends ConsumerStatefulWidget {
  const DateSelector(
      {super.key, required this.postDate, required this.dateChanged});

  final DateTime postDate;
  final Function dateChanged;

  @override
  ConsumerState<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends ConsumerState<DateSelector> {
  DateTime? newDate;

  @override
  Widget build(BuildContext context) {
    return SystemActionPage(
        body: SizedBox(
            height: 300,
            child: CupertinoTheme(
                data: CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                    dateTimePickerTextStyle: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: ref.watch(simpleFontProvider)
                            ? fontSimple
                            : fontWaxWing,
                        fontSize: 18),
                  ),
                ),
                child: CupertinoDatePicker(
                  minuteInterval: 15,
                  mode: CupertinoDatePickerMode.dateAndTime,
                  initialDateTime: widget.postDate,
                  minimumDate:
                      DateTime.now().subtract(const Duration(days: 36500)),
                  maximumDate: DateTime.now().add(const Duration(days: 36500)),
                  onDateTimeChanged: (DateTime newDateTime) {
                    setState(() {
                      newDate = newDateTime;
                    });
                  },
                ))),
        action: SaveButton(
          saving: false,
          onPressed: () {
            if (newDate != null) {
              widget.dateChanged(newDate!);
            }
            context.pop();
          },
          enabled: newDate != null && newDate != widget.postDate,
        ));
  }
}
