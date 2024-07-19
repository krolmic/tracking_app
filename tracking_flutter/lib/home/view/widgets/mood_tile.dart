part of '../home_screen.dart';

class _MoodTile extends StatelessWidget {
  const _MoodTile({
    required this.mood,
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
