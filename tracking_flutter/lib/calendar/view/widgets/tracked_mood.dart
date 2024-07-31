import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/shared/date_time.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/widgets/mood_emoji.dart';
import 'package:tracking_app/shared/widgets/spacing.dart';

class TrackedMood extends StatelessWidget {
  const TrackedMood({
    required this.mood,
    super.key,
  });

  final Mood mood;

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () => context.go('/calendar/update', extra: mood),
      child: Card(
        elevation: 5,
        shadowColor: contentShadowColor,
        child: Container(
          width: 100,
          height: 150,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: lightBlueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: MoodEmoji(
                    moodValue: mood.value,
                  ),
                ),
              ),
              const VerticalSpacing.small(),
              Text(
                getDateString(
                  context,
                  mood.createdOn,
                  includeYear: false,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                '${translations.mood}: ${mood.value}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: tileSubtitleColor,
                    ),
              ),
              const VerticalSpacing.medium(),
              Icon(
                Iconsax.edit_2_outline,
                size: 20,
                color: tileIconColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
