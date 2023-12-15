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
          child: _MoodEmoji(
            moodValue: mood.value,
          ),
        ),
      ),
      title: _getDateString(context),
      subTitle: _getTimeString(),
      onTap: () => context.go('/home/update', extra: mood),
    );
  }

  String _getDateString(BuildContext context) {
    if (_dateIsToday(mood.createdOn)) {
      return AppLocalizations.of(context)!.today;
    }

    return Jiffy.parseFromDateTime(mood.createdOn).yMMMMd;
  }

  String _getTimeString() {
    return Jiffy.parseFromDateTime(mood.createdOn).jm;
  }

  bool _dateIsToday(DateTime date) {
    final now = DateTime.now();

    return date.day == now.day &&
        date.month == now.month &&
        date.year == now.year;
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
