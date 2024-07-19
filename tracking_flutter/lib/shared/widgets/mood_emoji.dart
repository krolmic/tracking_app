import 'package:flutter/material.dart';

class MoodEmoji extends StatelessWidget {
  const MoodEmoji({
    required this.moodValue,
    super.key,
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
