extension DurationX on Duration {
  String toFormattedString() {
    if (this == Duration.zero) {
      return '0 min';
    }

    final hours = inHours;
    final minutes = inMinutes.remainder(60);
    final minutesString = minutes != 0 ? '$minutes min' : '';
    final hoursString = hours != 0 ? '$hours h ' : '';

    return '$hoursString$minutesString';
  }
}
