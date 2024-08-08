extension DoubleX on double {
  String toFormattedString() {
    final str = toStringAsFixed(2);
    return str.endsWith('.00') ? str.substring(0, str.length - 3) : str;
  }
}
