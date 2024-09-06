import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graph_settings_repository/graph_settings_repository.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/graph/view/widgets/line_graph.dart';

void main() {
  testWidgets(
      'LineGraph displays correct bottom titles '
      'for weekly mode spanning two months', (WidgetTester tester) async {
    // Set up a date that falls in a week spanning two months
    final targetDate = DateTime(2024, 7, 30); // Sunday, July 30, 2024

    // Create mock data
    final moods = List.generate(
      7,
      (index) => Mood(
        id: 1,
        value: 5,
        createdOn: targetDate.add(Duration(days: index)),
      ),
    );
    final moodsWithTrackedRevenue = <Mood>[];
    final moodsWithTrackedWorkTime = <Mood>[];

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: LineGraph(
            targetDate: targetDate,
            moods: moods,
            moodsWithTrackedRevenue: moodsWithTrackedRevenue,
            moodsWithTrackedWorkTime: moodsWithTrackedWorkTime,
            currencySymbol: r'$',
            timeRangeMode: GraphTimeRangeMode.weekly,
          ),
        ),
      ),
    );

    // Wait for any animations to complete
    await tester.pumpAndSettle();

    // Verify that the correct dates and day numbers are displayed
    expect(find.text('29'), findsOneWidget);
    expect(find.text('Jul 30'), findsOneWidget);
    expect(find.text('31'), findsOneWidget);
    expect(find.text('Aug 1'), findsOneWidget);
    // day number (bottom) & mood value (left)
    expect(find.text('2'), findsExactly(2));
    expect(find.text('Aug 3'), findsOneWidget);
    // day number (bottom) & mood value (left)
    expect(find.text('4'), findsExactly(2));
  });
}
