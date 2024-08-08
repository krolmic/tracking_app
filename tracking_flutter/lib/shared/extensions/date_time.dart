import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jiffy/jiffy.dart';

extension DateTimeX on DateTime {
  DateTime get startOfMonth => DateTime(year, month);

  DateTime get endOfMonth => DateTime(year, month + 1, 0);

  DateTime get startOfWeek => subtract(Duration(days: weekday - 1));

  DateTime get endOfWeek => add(Duration(days: 7 - weekday));

  DateTime get dateOnly => DateTime(year, month, day);

  bool get isAfterToday => isAfter(DateTime.now());

  bool get isTodayOrBeforeToday => !isAfterToday;

  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  bool isSameMonth(DateTime other) =>
      year == other.year && month == other.month;

  bool get isToday {
    final now = DateTime.now();

    return day == now.day && month == now.month && year == now.year;
  }

  String getDateString(
    BuildContext? context, {
    bool includeYear = true,
    bool includeDay = true,
  }) {
    if (context != null && isToday) {
      return AppLocalizations.of(context)!.today;
    }

    if (!includeDay) {
      return Jiffy.parseFromDateTime(this).yMMMM;
    }

    if (!includeYear) {
      return Jiffy.parseFromDateTime(this).MMMd;
    }

    return Jiffy.parseFromDateTime(this).yMMMMd;
  }

  String getTimeString() {
    return Jiffy.parseFromDateTime(this).jm;
  }

  String getGreetingString(AppLocalizations translations) {
    if (hour >= 17) {
      return translations.goodEvening;
    } else if (hour >= 12) {
      return translations.goodAfternoon;
    }

    return translations.goodMorning;
  }
}
