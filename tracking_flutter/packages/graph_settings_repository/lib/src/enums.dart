enum GraphTimeRangeMode {
  weekly,
  monthly;

  bool get isMonthly => this == GraphTimeRangeMode.monthly;
  bool get isWeekly => this == GraphTimeRangeMode.weekly;

  static GraphTimeRangeMode fromString(String value) {
    return GraphTimeRangeMode.values.firstWhere(
      (mode) => mode.name == value,
      orElse: () => GraphTimeRangeMode.weekly,
    );
  }
}
