import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/shared/extensions/date_time.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/widgets/mood_emoji.dart';
import 'package:tracking_app/shared/widgets/tile.dart';

class TrackedMood extends StatelessWidget {
  const TrackedMood({
    required this.onTap,
    required this.mood,
    super.key,
  });

  final Mood mood;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return Tile(
      icon: Iconsax.edit_2_outline,
      iconSize: 20,
      leading: Container(
        width: 50,
        decoration: BoxDecoration(
          color: AppColors.lightBlueAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: MoodEmoji(
            moodValue: mood.value,
          ),
        ),
      ),
      title: mood.createdOn.getDateString(context),
      subTitle: '${translations.mood}: ${mood.value}',
      onTap: onTap,
    );
  }
}
