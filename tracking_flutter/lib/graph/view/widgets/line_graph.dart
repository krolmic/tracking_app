import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graph_settings_repository/graph_settings_repository.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/shared/extensions/date_time.dart';
import 'package:tracking_app/shared/extensions/double.dart';
import 'package:tracking_app/shared/extensions/duration.dart';
import 'package:tracking_app/shared/theme/animation.dart';
import 'package:tracking_app/shared/theme/colors.dart';

class LineGraphTheme {
  LineGraphTheme._();

  static const leftTitlesTextStyle = TextStyle(
    fontSize: 14,
  );
  static const leftSmallTitlesTextStyle = TextStyle(
    fontSize: 8,
    color: AppColors.grey,
  );
  static const bottomTitlesTextStyle = TextStyle(
    fontSize: 14,
  );
  static const bottomSmallTitlesTextStyle = TextStyle(
    fontSize: 8,
    color: AppColors.grey,
  );

  static Color toolTipBackgroundColor = AppColors.darkBlue;
  static const Color toolTipFontColor = AppColors.contentOnDarkBackgroundColor;
  static const TextStyle toolTipTextStyle = TextStyle(
    color: LineGraphTheme.toolTipFontColor,
  );

  static const FlLine touchedSpotLine = FlLine(
    color: AppColors.darkBlue,
    strokeWidth: 3,
  );
  static FlDotData touchedSpotDotData = FlDotData(
    getDotPainter: (spot, percent, barData, index) {
      return FlDotCirclePainter(
        strokeColor: AppColors.darkBlue,
        radius: 4,
        color: Colors.white,
        strokeWidth: 2,
      );
    },
  );

  static Border border = Border(
    bottom: BorderSide(color: AppColors.darkBlue.withOpacity(0.2), width: 4),
    left: const BorderSide(color: Colors.transparent),
    right: const BorderSide(color: Colors.transparent),
    top: const BorderSide(color: Colors.transparent),
  );

  static const Color moodsLineChartBarColor = AppColors.darkBlue;
  static LinearGradient moodsLineChartBelowBarGradient = LinearGradient(
    colors: [
      AppColors.gradientColor3.withOpacity(0.3),
      AppColors.gradientColor3.withOpacity(0.2),
      AppColors.gradientColor2.withOpacity(0.2),
    ],
    stops: const [
      0,
      0.2,
      1,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const Color revenueLineCharBarColor = Color(0xFFFFEB3C);
  static const Color workHoursLineCharBarColor = AppColors.blue;
}

class LineGraph extends StatelessWidget {
  const LineGraph({
    required this.targetDate,
    required this.moods,
    required this.moodsWithTrackedRevenue,
    required this.moodsWithTrackedWorkTime,
    required this.currencySymbol,
    required this.timeRangeMode,
    super.key,
  });

  final DateTime targetDate;
  final List<Mood> moods;
  final List<Mood> moodsWithTrackedRevenue;
  final List<Mood> moodsWithTrackedWorkTime;
  final String currencySymbol;
  final GraphTimeRangeMode timeRangeMode;

  static const minX = 1;

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return LineChart(
      lineChartData(translations),
      duration: animationDuration,
    );
  }

  /// Returns the maximum value for the x-axis.
  ///
  /// If [timeRangeMode] is [GraphTimeRangeMode.monthly],
  /// the maximum value is the last day of the month.
  ///
  /// Otherwise (if [timeRangeMode] is [GraphTimeRangeMode.weekly]),
  /// the maximum value is 7.
  double get maxX {
    if (timeRangeMode.isMonthly) {
      return targetDate.endOfMonth.day.toDouble();
    } else {
      return 7;
    }
  }

  LineChartData lineChartData(AppLocalizations translations) => LineChartData(
        lineTouchData: lineTouchData(translations),
        gridData: gridData,
        titlesData: titlesData,
        borderData: borderData,
        lineBarsData: lineBarsData,
        minX: minX.toDouble(),
        maxX: maxX,
        maxY: 10,
        minY: 0,
      );

  LineTouchData lineTouchData(AppLocalizations translations) => LineTouchData(
        getTouchedSpotIndicator: (barData, spotIndexes) {
          return spotIndexes.map((spotIndex) {
            return TouchedSpotIndicatorData(
              LineGraphTheme.touchedSpotLine,
              LineGraphTheme.touchedSpotDotData,
            );
          }).toList();
        },
        touchTooltipData: LineTouchTooltipData(
          tooltipRoundedRadius: 10,
          getTooltipColor: (touchedSpot) =>
              LineGraphTheme.toolTipBackgroundColor,
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((LineBarSpot touchedSpot) {
              final flSpot = touchedSpot;

              final isRevenueSpot = flSpot.barIndex == 0;
              final isWorkTimeSpot = flSpot.barIndex == 1;
              final isMoodSpot = flSpot.barIndex == 2;

              String text;
              if (isRevenueSpot) {
                final revenue =
                    moodsWithTrackedRevenue[flSpot.spotIndex].revenue;
                text = '${translations.revenue}:\n'
                    '${revenue!.toFormattedString()} '
                    '$currencySymbol';
              } else if (isWorkTimeSpot) {
                final mood = moodsWithTrackedWorkTime[flSpot.spotIndex];
                final workTime = mood.workTime!.toFormattedString();
                text = '${translations.workTime}:\n'
                    '$workTime';
              } else if (isMoodSpot) {
                text = '${translations.mood}: '
                    '${moods[flSpot.spotIndex].value}';
              } else {
                text = '';
              }

              return LineTooltipItem(
                text,
                LineGraphTheme.toolTipTextStyle,
              );
            }).toList();
          },
        ),
      );

  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(),
        topTitles: const AxisTitles(),
        leftTitles: AxisTitles(
          sideTitles: leftTitles,
        ),
      );

  List<LineChartBarData> get lineBarsData => [
        revenueLineChartBarData,
        workTimeLineChartBarData,
        moodsLineChartBarData,
      ];

  Widget getLeftTitle(double value, TitleMeta meta) {
    if (value == 0 || value == 3 || value == 6 || value == 10) {
      return Text(
        value.toInt().toString(),
        style: LineGraphTheme.leftTitlesTextStyle,
        textAlign: TextAlign.center,
      );
    } else {
      return Text(
        value.toInt().toString(),
        style: LineGraphTheme.leftSmallTitlesTextStyle,
        textAlign: TextAlign.center,
      );
    }
  }

  SideTitles get leftTitles => SideTitles(
        getTitlesWidget: getLeftTitle,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  /// Returns the bottom title for the given [value]
  /// (between [minX] and [maxX]).
  ///
  /// The title represents day of the selected month based on [value].
  Widget getBottomTitleForMonthlyMode(double value, TitleMeta meta) {
    if (value == 5 || value == 15 || value == 25) {
      final day = DateTime(targetDate.year, targetDate.month, value.toInt());

      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 10,
        child: Text(
          day.getDateString(
            null,
            includeYear: false,
          ),
          style: LineGraphTheme.bottomTitlesTextStyle,
        ),
      );
    } else if (value.toInt().isOdd) {
      return Text(
        value.toInt().toString(),
        style: LineGraphTheme.bottomSmallTitlesTextStyle,
      );
    } else {
      return const SizedBox();
    }
  }

  /// Returns the bottom title for the given [value]
  /// (between [minX] and [maxX]).
  ///
  /// The title represents day of the selected week based on [value].
  Widget getBottomTitleForWeeklyMode(double value, TitleMeta meta) {
    final valueWeekDates = targetDate.weekDates;
    final valueDateIndex = value.toInt() - 1;
    final valueDate = valueWeekDates[valueDateIndex];

    final isEverySecondDate = value.toInt().isEven;

    if (isEverySecondDate) {
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 10,
        child: Text(
          valueDate.getDateString(
            null,
            includeYear: false,
          ),
          style: LineGraphTheme.bottomTitlesTextStyle,
        ),
      );
    } else {
      return Text(
        valueDate.day.toString(),
        style: LineGraphTheme.bottomSmallTitlesTextStyle,
      );
    }
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: timeRangeMode.isMonthly
            ? getBottomTitleForMonthlyMode
            : getBottomTitleForWeeklyMode,
      );

  FlGridData get gridData => const FlGridData(
        drawHorizontalLine: false,
        drawVerticalLine: false,
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: LineGraphTheme.border,
      );

  LineChartBarData get moodsLineChartBarData => LineChartBarData(
        color: LineGraphTheme.moodsLineChartBarColor,
        dotData: const FlDotData(show: false),
        isCurved: true,
        curveSmoothness: 0.2,
        belowBarData: BarAreaData(
          show: true,
          gradient: LineGraphTheme.moodsLineChartBelowBarGradient,
        ),
        spots: moodsSpots,
      );

  List<FlSpot> get moodsSpots => moods
      .map(
        (mood) => FlSpot(
          getSpotXValue(mood.createdOn),
          mood.value.toDouble(),
        ),
      )
      .toList();

  LineChartBarData get revenueLineChartBarData => LineChartBarData(
        color: LineGraphTheme.revenueLineCharBarColor,
        barWidth: 3,
        dotData: const FlDotData(show: false),
        spots: revenueSpots,
      );

  double get greatestRevenue {
    return moodsWithTrackedRevenue.fold<double>(0, (previousValue, element) {
      return element.revenue! > previousValue
          ? element.revenue!
          : previousValue;
    });
  }

  List<FlSpot> get revenueSpots => moodsWithTrackedRevenue
      .map(
        (mood) => FlSpot(
          getSpotXValue(mood.createdOn),
          greatestRevenue != 0 ? (mood.revenue! / greatestRevenue) * 10 : 0,
        ),
      )
      .toList();

  LineChartBarData get workTimeLineChartBarData => LineChartBarData(
        color: LineGraphTheme.workHoursLineCharBarColor,
        dotData: const FlDotData(show: false),
        spots: workTimeSpots,
      );

  Duration get greatestWorkTime {
    return moodsWithTrackedWorkTime.fold<Duration>(Duration.zero,
        (previousValue, element) {
      return element.workTime! > previousValue
          ? element.workTime!
          : previousValue;
    });
  }

  List<FlSpot> get workTimeSpots => moodsWithTrackedWorkTime
      .map(
        (mood) => FlSpot(
          getSpotXValue(mood.createdOn),
          greatestWorkTime != Duration.zero
              ? (mood.workTime!.inMinutes / greatestWorkTime.inMinutes) * 10
              : 0,
        ),
      )
      .toList();

  double getSpotXValue(DateTime date) {
    return timeRangeMode.isMonthly
        ? date.day.toDouble()
        : date.weekday.toDouble();
  }
}
