part of '../moods_screen.dart';

class _TrackedMood extends StatelessWidget {
  const _TrackedMood({
    required this.mood,
  });

  final Mood mood;

  @override
  Widget build(BuildContext context) {
    return Tile(
      icon: Icons.edit_outlined,
      iconSize: 20,
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
