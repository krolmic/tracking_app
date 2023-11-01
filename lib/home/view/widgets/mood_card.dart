part of '../home_screen.dart';

class _MoodCard extends StatelessWidget {
  const _MoodCard({
    required this.mood,
  });

  final Mood mood;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: moodValueColor(mood.value),
          child: Text(
            mood.value.toString(),
          ),
        ),
        title: Text(
          Jiffy.parseFromDateTime(mood.createdOn).yMMMMd,
        ),
        titleAlignment: ListTileTitleAlignment.threeLine,
        onTap: () {
          context.go('/home/update', extra: mood);
        },
      ),
    );
  }
}
