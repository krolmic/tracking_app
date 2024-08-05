part of '../graph_screen.dart';

class _MonthsSelection extends StatelessWidget {
  const _MonthsSelection({
    required this.currentMonth,
    required this.selectedMonth,
    required this.onMonthSelected,
  });

  final int currentMonth;
  final int selectedMonth;
  final void Function(int) onMonthSelected;

  static const double monthWidth = 70;

  @override
  Widget build(BuildContext context) {
    final selectedMonthIndex = selectedMonth - 1;

    // Scroll to the month before the selected month so that
    // user is able to select it without scrolling
    final scrollController = ScrollController(
      initialScrollOffset:
          (selectedMonthIndex - 1) * (monthWidth + horizontalPaddingSmall),
    );

    return SizedBox(
      height: 50,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: 12,
        itemBuilder: (context, index) {
          final monthIndex = index + 1;
          final isCurrentMonth = monthIndex == selectedMonth;
          final isDisabled = monthIndex > currentMonth;

          Color textColor;
          if (isCurrentMonth) {
            textColor = contentOnDarkBackgroundColor;
          } else if (isDisabled) {
            textColor = lightGrey;
          } else {
            textColor = Colors.black;
          }

          Color backgroundColor;
          if (isCurrentMonth) {
            backgroundColor = primarySwatch;
          } else {
            backgroundColor = Colors.transparent;
          }

          return GestureDetector(
            key: ValueKey(index),
            onTap: isDisabled
                ? null
                : () {
                    onMonthSelected(monthIndex);
                  },
            child: Container(
              width: monthWidth,
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                left: index == 0 ? viewPaddingHorizontal : 0,
                right: index == 11
                    ? viewPaddingHorizontal
                    : horizontalPaddingSmall,
                top: horizontalPaddingSmall,
                bottom: horizontalPaddingSmall,
              ),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                getMonthName(monthIndex),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: textColor,
                      fontWeight: monthIndex == selectedMonth
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }

  String getMonthName(int month) {
    return Jiffy.parseFromDateTime(DateTime(0, month)).MMM;
  }
}
