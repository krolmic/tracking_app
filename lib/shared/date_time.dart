import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jiffy/jiffy.dart';

/// Returns a formatted date string based on the date of the passed [dateTime].
String getDateString(BuildContext context, DateTime dateTime) {
  if (_dateIsToday(dateTime)) {
    return AppLocalizations.of(context)!.today;
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
  String firstName,
) {
  final translations = AppLocalizations.of(context)!;

  if (dateTime.hour >= 17) {
    return translations.goodEvening(firstName);
  } else if (dateTime.hour >= 12) {
    return translations.goodAfternoon(firstName);
  }

  return translations.goodMorning(firstName);
}
