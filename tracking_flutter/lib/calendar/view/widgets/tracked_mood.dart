import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    return GestureDetector(
      onTap: () => context.go('/calendar/update', extra: mood),
      child: Card(
        elevation: 5,
        shadowColor: tileShadowColor,
        child: Container(
          width: 100,
          height: 125,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: primarySwatch.shade200,
                child: Center(
                  child: MoodEmoji(
                    moodValue: mood.value,
                  ),
                ),
              ),
              const VerticalSpacing.small(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    getDateString(
                      context,
                      mood.createdOn,
                      includeYear: false,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: tileTitleColor,
                      fontSize: 15,
                    ),
                  ),
                  const HorizontalSpacing.small(),
                ],
              ),
              const VerticalSpacing.medium(),
              Icon(
                Icons.edit,
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
