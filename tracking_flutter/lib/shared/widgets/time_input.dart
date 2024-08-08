import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tracking_app/shared/extensions/duration.dart';

class TimeInput extends StatelessWidget {
  const TimeInput({required this.onChange, required this.time, super.key});

  final Duration time;
  final void Function(Duration) onChange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final updatedWorkTime = await showDurationPicker(
          context: context,
          initialTime: time,
          upperBound: const Duration(hours: 24),
        );

        if (updatedWorkTime != null) {
          onChange(updatedWorkTime);
        }
      },
      child: Container(
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
