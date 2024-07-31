part of '../graph_screen.dart';

class _LineGraphStyle {
  _LineGraphStyle._();

  static const leftTitlesTextStyle = TextStyle(
    fontSize: 14,
  );
  static const leftSmallTitlesTextStyle = TextStyle(
    fontSize: 8,
    color: grey,
  );
  static const bottomTitlesTextStyle = TextStyle(
    fontSize: 14,
  );
  static const bottomSmallTitlesTextStyle = TextStyle(
    fontSize: 8,
    color: grey,
  );

  static Color toolTipBackgroundColor = darkBlue;
  static const Color toolTipFontColor = contentOnDarkBackgroundColor;
  static const TextStyle toolTipTextStyle = TextStyle(
    color: _LineGraphStyle.toolTipFontColor,
  );

  static const FlLine touchedSpotLine = FlLine(
    color: darkBlue,
    strokeWidth: 3,
  );
  static FlDotData touchedSpotDotData = FlDotData(
    getDotPainter: (spot, percent, barData, index) {
      return FlDotCirclePainter(
        strokeColor: darkBlue,
        radius: 4,
        color: Colors.white,
        strokeWidth: 2,
      );
    },
  );

  static Border border = Border(
    bottom: BorderSide(color: darkBlue.withOpacity(0.2), width: 4),
    left: const BorderSide(color: Colors.transparent),
    right: const BorderSide(color: Colors.transparent),
    top: const BorderSide(color: Colors.transparent),
  );

  static const Color moodsLineChartBarColor = darkBlue;
  static LinearGradient moodsLineChartBelowBarGradient = LinearGradient(
    colors: [
      gradientColor3.withOpacity(0.3),
      gradientColor3.withOpacity(0.2),
      gradientColor2.withOpacity(0.2),
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
  static const Color workHoursLineCharBarColor = blue;
}

class _LineGraph extends StatelessWidget {
  const _LineGraph({
    required this.targetDate,
    required this.moods,
    required this.moodsWithTrackedRevenue,
    required this.moodsWithTrackedWorkTime,
  });

  final DateTime targetDate;
  final List<Mood> moods;
  final List<Mood> moodsWithTrackedRevenue;
  final List<Mood> moodsWithTrackedWorkTime;

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return LineChart(
      lineChartData(translations),
      duration: animationDuration,
    );
  }

  LineChartData lineChartData(AppLocalizations translations) => LineChartData(
        lineTouchData: lineTouchData(translations),
        gridData: gridData,
        titlesData: titlesData,
        borderData: borderData,
        lineBarsData: lineBarsData,
        minX: 1,
        maxX: targetDate.endOfMonth.day.toDouble(),
        maxY: 10,
        minY: 0,
      );

  LineTouchData lineTouchData(AppLocalizations translations) => LineTouchData(
        getTouchedSpotIndicator: (barData, spotIndexes) {
          return spotIndexes.map((spotIndex) {
            return TouchedSpotIndicatorData(
              _LineGraphStyle.touchedSpotLine,
              _LineGraphStyle.touchedSpotDotData,
            );
          }).toList();
        },
        touchTooltipData: LineTouchTooltipData(
          tooltipRoundedRadius: 10,
          getTooltipColor: (touchedSpot) =>
              _LineGraphStyle.toolTipBackgroundColor,
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((LineBarSpot touchedSpot) {
              final flSpot = touchedSpot;

              final isRevenueSpot = flSpot.barIndex == 0;
              final isWorkTimeSpot = flSpot.barIndex == 1;
              final isMoodSpot = flSpot.barIndex == 2;

              String text;
              if (isRevenueSpot) {
                text = '${translations.revenue}:\n'
                    '${moodsWithTrackedRevenue[flSpot.spotIndex].revenue}\$';
              } else if (isWorkTimeSpot) {
                final mood = moodsWithTrackedWorkTime[flSpot.spotIndex];
                text = '${translations.workTime}:\n'
                    '${mood.workTime!.toFormattedString()}';
              } else if (isMoodSpot) {
                text = '${translations.mood}: '
                    '${moods[flSpot.spotIndex].value}';
              } else {
                text = '';
              }

              return LineTooltipItem(
                text,
                _LineGraphStyle.toolTipTextStyle,
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
        style: _LineGraphStyle.leftTitlesTextStyle,
        textAlign: TextAlign.center,
      );
    } else {
      return Text(
        value.toInt().toString(),
        style: _LineGraphStyle.leftSmallTitlesTextStyle,
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

  Widget getBottomTitle(double value, TitleMeta meta) {
    if (value == 5 || value == 15 || value == 25) {
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 10,
        child: Text(
          getDateString(
            null,
            DateTime(targetDate.year, targetDate.month, value.toInt()),
            includeYear: false,
          ),
          style: _LineGraphStyle.bottomTitlesTextStyle,
        ),
      );
    } else if (value.toInt().isOdd) {
      return Text(
        value.toInt().toString(),
        style: _LineGraphStyle.bottomSmallTitlesTextStyle,
      );
    } else {
      return const SizedBox();
    }
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: getBottomTitle,
      );

  FlGridData get gridData => const FlGridData(
        drawHorizontalLine: false,
        drawVerticalLine: false,
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: _LineGraphStyle.border,
      );

  LineChartBarData get moodsLineChartBarData => LineChartBarData(
        color: _LineGraphStyle.moodsLineChartBarColor,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          gradient: _LineGraphStyle.moodsLineChartBelowBarGradient,
        ),
        spots: moodsSpots,
      );

  List<FlSpot> get moodsSpots => moods
      .map(
        (mood) => FlSpot(
          mood.createdOn.day.toDouble(),
          mood.value.toDouble(),
        ),
      )
      .toList();

  LineChartBarData get revenueLineChartBarData => LineChartBarData(
        color: _LineGraphStyle.revenueLineCharBarColor,
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
          mood.createdOn.day.toDouble(),
          greatestRevenue != 0 ? (mood.revenue! / greatestRevenue) * 10 : 0,
        ),
      )
      .toList();

  LineChartBarData get workTimeLineChartBarData => LineChartBarData(
        color: _LineGraphStyle.workHoursLineCharBarColor,
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
          mood.createdOn.day.toDouble(),
          greatestWorkTime != Duration.zero
              ? (mood.workTime!.inMinutes / greatestWorkTime.inMinutes) * 10
              : 0,
        ),
      )
      .toList();
}
