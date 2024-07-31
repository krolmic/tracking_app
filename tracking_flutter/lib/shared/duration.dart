extension DurationX on Duration {
  String toFormattedString() {
    final hours = inHours;
    final minutes = inMinutes.remainder(60);
    return '${hours}h ${minutes}min';
  }
}
