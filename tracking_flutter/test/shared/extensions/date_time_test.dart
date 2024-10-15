import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tracking_app/shared/extensions/date_time.dart';

void main() {
  group('DateTimeX', () {
    test('fromWeekNumber returns correct date', () {
      final date = DateTime(2023);
      expect(date.fromWeekNumber(1), DateTime(2023, 1, 2));
      expect(date.fromWeekNumber(2), DateTime(2023, 1, 9));
    });

    test('startOfMonth returns correct date', () {
      final date = DateTime(2023, 3, 15);
      expect(date.startOfMonth, DateTime(2023, 3));
    });

    test('endOfMonth returns correct date', () {
      final date = DateTime(2023, 3, 15);
      expect(date.endOfMonth, DateTime(2023, 3, 31, 23, 59, 59, 999, 999));
    });

    test('startOfWeek returns correct date', () {
      final date = DateTime(2023, 3, 15); // Wednesday
      expect(date.startOfWeek, DateTime(2023, 3, 13)); // Monday
    });

    test('endOfWeek returns correct date time', () {
      final date = DateTime(2023, 3, 15); // Wednesday
      expect(
        date.endOfWeek,
        DateTime(2023, 3, 19, 23, 59, 59, 999, 999),
      ); // Sunday
    });

    test('weekDates returns correct list of dates', () {
      final date = DateTime(2023, 3, 15); // Wednesday
      final weekDates = date.weekDates;
      expect(weekDates.length, 7);
      expect(weekDates.first, DateTime(2023, 3, 13)); // Monday
      expect(weekDates.last, DateTime(2023, 3, 19)); // Sunday
    });

    test('isThisWeek returns true for dates in the current week', () {
      final now = DateTime(2024, 8, 28);
      final today = DateTime(now.year, now.month, now.day);

      // Test today
      expect(today.isThisWeek(now), true);

      // Test tomorrow
      expect(today.add(const Duration(days: 1)).isThisWeek(now), true);

      // Test yesterday
      expect(today.subtract(const Duration(days: 1)).isThisWeek(now), true);

      // Test start of week
      expect(today.startOfWeek.isThisWeek(now), true);

      // Test end of week
      expect(today.endOfWeek.isThisWeek(now), true);
    });

    test('isThisWeek returns false for dates outside the current week', () {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);

      // Test last week
      expect(today.subtract(const Duration(days: 7)).isThisWeek(now), false);

      // Test next week
      expect(today.add(const Duration(days: 7)).isThisWeek(now), false);

      // Test last month
      expect(DateTime(now.year, now.month - 1, now.day).isThisWeek(now), false);

      // Test next month
      expect(DateTime(now.year, now.month + 1, now.day).isThisWeek(now), false);

      // Test last year
      expect(DateTime(now.year - 1, now.month, now.day).isThisWeek(now), false);

      // Test next year
      expect(DateTime(now.year + 1, now.month, now.day).isThisWeek(now), false);
    });

    test('isThisWeek handles week spanning two months correctly', () {
      // Assuming the week starts on Monday
      final mondayOfLastWeekOfMonth = DateTime(2023, 7, 31); // A Monday
      final sundayOfFirstWeekOfNextMonth =
          DateTime(2023, 8, 6); // The following Sunday

      final now = DateTime(2023, 8, 2); // A Wednesday in the same week

      expect(mondayOfLastWeekOfMonth.isThisWeek(now), true);
      expect(sundayOfFirstWeekOfNextMonth.isThisWeek(now), true);
    });

    test('isThisWeek handles week spanning two years correctly', () {
      // Assuming the week starts on Monday
      final mondayOfLastWeekOfYear = DateTime(2023, 12, 25); // A Monday
      final sundayOfFirstWeekOfNextYear =
          DateTime(2023, 12, 31); // The following Sunday

      final now = DateTime(2023, 12, 27); // A Wednesday in the same week

      expect(mondayOfLastWeekOfYear.isThisWeek(now), true);
      expect(sundayOfFirstWeekOfNextYear.isThisWeek(now), true);
    });

    test('dateOnly returns date without time', () {
      final date = DateTime(2023, 3, 15, 12, 30, 45);
      expect(date.dateOnly, DateTime(2023, 3, 15));
    });

    test('isAfterToday returns correct boolean', () {
      final today = DateTime.now();
      final tomorrow = today.add(const Duration(days: 1));
      final yesterday = today.subtract(const Duration(days: 1));

      expect(tomorrow.isAfterToday, true);
      expect(yesterday.isAfterToday, false);
    });

    test('isTodayOrBeforeToday returns correct boolean', () {
      final today = DateTime.now();
      final tomorrow = today.add(const Duration(days: 1));
      final yesterday = today.subtract(const Duration(days: 1));

      expect(today.isTodayOrBeforeToday, true);
      expect(yesterday.isTodayOrBeforeToday, true);
      expect(tomorrow.isTodayOrBeforeToday, false);
    });

    test('isSameDay returns correct boolean', () {
      final date1 = DateTime(2023, 3, 15, 12, 30);
      final date2 = DateTime(2023, 3, 15, 18, 45);
      final date3 = DateTime(2023, 3, 16);

      expect(date1.isSameDay(date2), true);
      expect(date1.isSameDay(date3), false);
    });

    test('isSameMonth returns correct boolean', () {
      final date1 = DateTime(2023, 3, 15);
      final date2 = DateTime(2023, 3, 30);
      final date3 = DateTime(2023, 4);

      expect(date1.isSameMonth(date2), true);
      expect(date1.isSameMonth(date3), false);
    });

    test('weekNumber returns correct number', () {
      expect(DateTime(2020, 12, 28).weekNumber, 53); // Last week of 2020
      expect(DateTime(2023).weekNumber, 52); // Last week of 2022
      expect(DateTime(2023, 1, 2).weekNumber, 1); // First week of 2023
      expect(DateTime(2023, 12, 31).weekNumber, 52); // Last week of 2023
      expect(DateTime(2024).weekNumber, 1); // First week of 2024
      expect(DateTime(2024, 8, 29).weekNumber, 35); // 35th week of 2024
      expect(DateTime(2024, 12, 30).weekNumber, 1); // First week of 2025
      expect(DateTime(2025).weekNumber, 1); // First week of 2025
      expect(DateTime(2025, 4, 2).weekNumber, 14); // 14th week of 2025
    });

    testWidgets('getDateString returns correct string',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (BuildContext context) {
              final date = DateTime(2023, 3, 15);
              expect(date.getDateString(context), 'March 15, 2023');
              expect(
                date.getDateString(context, includeYear: false),
                'Mar 15',
              );
              expect(
                date.getDateString(context, includeDay: false),
                'March 2023',
              );
              return Container();
            },
          ),
        ),
      );
    });

    test('getTimeString returns correct string', () {
      final date = DateTime(2023, 3, 15, 14, 30);
      expect(date.getTimeString(), '2:30 PM');
    });

    testWidgets('getGreetingString returns correct greeting',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (BuildContext context) {
              final morning = DateTime(2023, 3, 15, 8);
              final afternoon = DateTime(2023, 3, 15, 14);
              final evening = DateTime(2023, 3, 15, 20);

              final translations = AppLocalizations.of(context)!;
              expect(
                morning.getGreetingString(translations),
                translations.goodMorning,
              );
              expect(
                afternoon.getGreetingString(translations),
                translations.goodAfternoon,
              );
              expect(
                evening.getGreetingString(translations),
                translations.goodEvening,
              );
              return Container();
            },
          ),
        ),
      );
    });
  });
}
