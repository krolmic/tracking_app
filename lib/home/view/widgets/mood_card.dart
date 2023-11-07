part of '../home_screen.dart';

class _MoodCard extends StatelessWidget {
  const _MoodCard({
    required this.mood,
  });

  final Mood mood;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: primarySwatch.shade100,
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: primarySwatch.shade300,
          child: Center(child: _MoodEmoji(moodValue: mood.value)),
        ),
        title: Text(
          Jiffy.parseFromDateTime(mood.createdOn).yMMMMd,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        titleAlignment: ListTileTitleAlignment.threeLine,
        subtitle: Text(
          Jiffy.parseFromDateTime(mood.createdOn).jm,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: primarySwatch.shade400,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: primarySwatch.shade200,
        ),
        onTap: () {
          context.go('/home/update', extra: mood);
        },
      ),
    );
  }
}

class _MoodEmoji extends StatelessWidget {
  const _MoodEmoji({
    required this.moodValue,
  });

  final int moodValue;

  static const double emojiFontSize = 25;

  @override
  Widget build(BuildContext context) {
    if (moodValue >= 9) {
      return const Text(
        '😎',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: emojiFontSize,
        ),
      );
    } else if (moodValue >= 6) {
      return const Text(
        '😊',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: emojiFontSize,
        ),
      );
    } else if (moodValue >= 4) {
      return const Text(
        '😐',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: emojiFontSize,
        ),
      );
    } else {
      return const Text(
        '😔',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: emojiFontSize,
        ),
      );
    }
  }
}
