import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jiffy/jiffy.dart';

/// Sets the [Jiffy] locale used for [DateTime] formatting
/// based on the passed [context].
void setDateTimeLocale(BuildContext context) {
  Jiffy.setLocale(
    Localizations.localeOf(context).languageCode,
  );
}

/// Returns a formatted date string based on the date of the passed [dateTime].
String getDateString(
  BuildContext? context,
  DateTime dateTime, {
  bool includeYear = true,
  bool includeDay = true,
}) {
  if (context != null && _dateIsToday(dateTime)) {
    return AppLocalizations.of(context)!.today;
  }

  if (!includeDay) {
    return Jiffy.parseFromDateTime(dateTime).yMMMM;
  }

  if (!includeYear) {
    return Jiffy.parseFromDateTime(dateTime).MMMd;
  }

  return Jiffy.parseFromDateTime(dateTime).yMMMMd;
}

/// Returns a formatted time string based on the time of the passed [dateTime].
String getTimeString(DateTime dateTime) {
  return Jiffy.parseFromDateTime(dateTime).jm;
}

/// Returns `true` if the passed [dateTime] is today.
bool _dateIsToday(DateTime dateTime) {
  final now = DateTime.now();

  return dateTime.day == now.day &&
      dateTime.month == now.month &&
      dateTime.year == now.year;
}

/// Returns a greeting string based on the time of the passed [dateTime].
String getGreetingString(
  BuildContext context,
  DateTime dateTime,
) {
  final translations = AppLocalizations.of(context)!;

  if (dateTime.hour >= 17) {
    return translations.goodEvening;
  } else if (dateTime.hour >= 12) {
    return translations.goodAfternoon;
  }

  return translations.goodMorning;
}

extension DateTimeX on DateTime {
  DateTime get startOfMonth => DateTime(year, month);
  DateTime get endOfMonth => DateTime(year, month + 1, 0);
  DateTime get startOfWeek => subtract(Duration(days: weekday - 1));
  DateTime get endOfWeek => add(Duration(days: 7 - weekday));
  DateTime get dateOnly => DateTime(year, month, day);
  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;
}
