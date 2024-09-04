import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tracking_app/shared/extensions/duration.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/theme/layout.dart';
import 'package:tracking_app/shared/widgets/spacing.dart';

class TimeInput extends StatelessWidget {
  const TimeInput({
    required this.onChange,
    required this.time,
    super.key,
  });

  final Duration time;
  final void Function(Duration) onChange;

  void _showTimePickerDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.backgroundColor,
        ),
        padding: const EdgeInsets.only(top: viewPaddingVertical),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SafeArea(
          top: false,
          child: CupertinoTheme(
            data: CupertinoThemeData(
              textTheme: CupertinoTextThemeData(
                pickerTextStyle: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            child: _IOSTimePicker(
              initialTime: time,
              onChange: onChange,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _TimeInputField(
      time: time,
      onTap: () => _showTimePickerDialog(context),
    );
  }
}

class _IOSTimePicker extends StatefulWidget {
  const _IOSTimePicker({
    required this.initialTime,
    required this.onChange,
  });

  final Duration initialTime;
  final void Function(Duration) onChange;

  @override
  State<_IOSTimePicker> createState() => _IOSTimePickerState();
}

class _IOSTimePickerState extends State<_IOSTimePicker> {
  int _hours = 0;
  int _minutes = 0;

  @override
  void initState() {
    super.initState();
    _hours = widget.initialTime.inHours;
    _minutes = widget.initialTime.inMinutes % 60;
  }

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return CupertinoTheme(
      data: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          pickerTextStyle: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      child: SizedBox(
        height: 220,
        child: Stack(
          children: [
            Center(
              child: Container(
                width: 230,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.inputFillColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 40,
                  child: CupertinoPicker(
                    selectionOverlay: const SizedBox.shrink(),
                    itemExtent: 32,
                    onSelectedItemChanged: (int value) {
                      widget.onChange(
                        Duration(hours: value, minutes: _minutes),
                      );

                      setState(() {
                        _hours = value;
                      });
                    },
                    scrollController: FixedExtentScrollController(
                      initialItem: widget.initialTime.inHours,
                    ),
                    children: List<Widget>.generate(24, (int index) {
                      return Center(
                        child: Text(index.toString().padLeft(2, '0')),
                      );
                    }),
                  ),
                ),
                Text(
                  translations.hours,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const HorizontalSpacing.large(),
                SizedBox(
                  width: 40,
                  child: CupertinoPicker(
                    selectionOverlay: const SizedBox.shrink(),
                    itemExtent: 32,
                    onSelectedItemChanged: (int value) {
                      widget.onChange(
                        Duration(hours: _hours, minutes: value),
                      );

                      setState(() {
                        _minutes = value;
                      });
                    },
                    scrollController: FixedExtentScrollController(
                      initialItem: widget.initialTime.inMinutes % 60,
                    ),
                    children: List<Widget>.generate(60, (int index) {
                      return Center(
                        child: Text(index.toString().padLeft(2, '0')),
                      );
                    }),
                  ),
                ),
                Text(
                  translations.minutes,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeInputField extends StatelessWidget {
  const _TimeInputField({required this.onTap, required this.time});

  final Duration time;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: Theme.of(context).inputDecorationTheme.contentPadding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).inputDecorationTheme.fillColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              time.toFormattedString(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Icon(
              Iconsax.edit_2_outline,
              color: Theme.of(context).primaryColor,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
