import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/shared/date_time.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/widgets/mood_emoji.dart';
import 'package:tracking_app/shared/widgets/tile.dart';

class MoodTile extends StatelessWidget {
  const MoodTile({
    required this.mood,
    super.key,
  });

  final Mood mood;

  @override
  Widget build(BuildContext context) {
    return Tile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: primarySwatch.shade200,
        child: Center(
          child: MoodEmoji(
            moodValue: mood.value,
          ),
        ),
      ),
      title: getDateString(context, mood.createdOn),
      subTitle: getTimeString(mood.createdOn),
      onTap: () => context.go('/home/update', extra: mood),
    );
  }
}
