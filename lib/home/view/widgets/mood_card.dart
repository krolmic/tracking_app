part of '../home_screen.dart';

class _MoodCard extends StatelessWidget {
  const _MoodCard({
    required this.mood,
  });

  final Mood mood;

  @override
  Widget build(BuildContext context) {
    return Tile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: primarySwatch.shade300,
        child: Center(
          child: _MoodEmoji(
            moodValue: mood.value,
          ),
        ),
      ),
      title: Jiffy.parseFromDateTime(mood.createdOn).yMMMMd,
      subTitle: Jiffy.parseFromDateTime(mood.createdOn).jm,
      onTap: () => context.go('/home/update', extra: mood),
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
