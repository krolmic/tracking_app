import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jiffy/jiffy.dart';

extension DateTimeX on DateTime {
  DateTime fromWeekNumber(int weekNumber) {
    // Find the first Thursday of the year.
    var firstThursday = DateTime(year);
    while (firstThursday.weekday != DateTime.thursday) {
      firstThursday = firstThursday.add(const Duration(days: 1));
    }

    // Calculate the date of the week.
    // Subtraction of 3 days at the end moves the date
    // to the Monday of the desired week.
    return firstThursday.add(Duration(days: (weekNumber - 1) * 7 - 3));
  }

  DateTime get previousMonth => startOfMonth.subtract(const Duration(days: 1));

  DateTime get nextMonth => endOfMonth.add(const Duration(days: 1));

  DateTime get previousYear => DateTime(year - 1);

  DateTime get nextYear => DateTime(year + 1);

  DateTime get startOfMonth => DateTime(year, month);

  DateTime get endOfMonth => DateTime(year, month + 1, 0, 23, 59, 59, 999, 999);

  DateTime get startOfWeek {
    final startOfWeekDateTime = subtract(Duration(days: weekday - 1));

    return DateTime(
      startOfWeekDateTime.year,
      startOfWeekDateTime.month,
      startOfWeekDateTime.day,
    );
  }

  DateTime get endOfWeek {
    final endOfWeekDateTime = add(Duration(days: 7 - weekday));

    return DateTime(
      endOfWeekDateTime.year,
      endOfWeekDateTime.month,
      endOfWeekDateTime.day,
      23,
      59,
      59,
      999,
      999,
    );
  }

  List<DateTime> get weekDates {
    return List.generate(
      endOfWeek.difference(startOfWeek).inDays + 1,
      (index) => startOfWeek.add(Duration(days: index)),
    );
  }

  int get numberOfWeeksInYear {
    final lastDayOfYear = DateTime(year, 12, 28);

    return lastDayOfYear.weekNumber;
  }

  int get weekNumber {
    final weekNumber = (daysSinceLastYear - weekday + 10) ~/ 7;

    if (weekNumber == 0) {
      return DateTime(year - 1, 12, 28).weekNumber;
    }

    final yearHas53Weeks = DateTime(year).weekday != DateTime.thursday &&
        DateTime(year, 12, 31).weekday != DateTime.thursday;

    if (weekNumber == 53 && yearHas53Weeks) {
      return 1;
    }

    return weekNumber;
  }

  int get daysSinceLastYear {
    final lastDayOfPreviousYear = DateTime(year - 1, 12, 31);
    return difference(lastDayOfPreviousYear).inDays;
  }

  DateTime get dateOnly => DateTime(year, month, day);

  bool get isAfterToday => isAfter(DateTime.now());

  bool get isTodayOrBeforeToday => !isAfterToday;

  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  bool isSameMonth(DateTime other) =>
      year == other.year && month == other.month;

  bool isThisWeek(DateTime now) {
    final startOfWeek = now.startOfWeek;
    final endOfWeek = now.endOfWeek;
    return isAfter(startOfWeek.subtract(const Duration(microseconds: 1))) &&
        isBefore(endOfWeek.add(const Duration(microseconds: 1)));
  }

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
