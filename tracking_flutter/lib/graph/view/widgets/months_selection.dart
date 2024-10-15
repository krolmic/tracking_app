part of '../graph_screen.dart';

class _MonthsSelection extends StatefulWidget {
  const _MonthsSelection({
    required this.currentMonth,
    required this.selectedMonth,
    required this.disableMonths,
    required this.onMonthSelected,
    required this.currentYear,
  });

  final int currentMonth;
  final int selectedMonth;
  final void Function(int) onMonthSelected;
  final bool disableMonths;
  final int currentYear;

  static const double monthWidth = 75;

  static const int firstMonthIndex = 0;
  static const int lastMonthIndex = 11;

  @override
  State<_MonthsSelection> createState() => _MonthsSelectionState();
}

class _MonthsSelectionState extends State<_MonthsSelection> {
  late ScrollController scrollController;
  int? previousYear;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController(
      initialScrollOffset: _getSelectedMonthScrollOffset(),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelectedMonth();
      previousYear = widget.currentYear;
    });
  }

  @override
  void didUpdateWidget(covariant _MonthsSelection oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Scroll to selected month if year has changed
    if (widget.currentYear != previousYear) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToSelectedMonth();
      });
      previousYear = widget.currentYear;
    }
  }

  void _scrollToSelectedMonth() {
    final scrollOffset = _getSelectedMonthScrollOffset();

    if (scrollController.hasClients &&
        scrollOffset != scrollController.offset) {
      scrollController.animateTo(
        scrollOffset,
        duration: animationDuration,
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return SizedBox(
      height: 50,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: 12,
        itemBuilder: (context, index) {
          final monthIndex = index + 1;
          final isCurrentMonth = monthIndex == widget.selectedMonth;
          final isDisabled =
              widget.disableMonths && monthIndex > widget.currentMonth;

          Color textColor;
          if (isCurrentMonth) {
            textColor = AppColors.contentOnDarkBackgroundColor;
          } else if (isDisabled) {
            textColor = AppColors.lightGrey;
          } else {
            textColor = Colors.black;
          }

          Color backgroundColor;
          if (isCurrentMonth) {
            backgroundColor = AppColors.primarySwatch;
          } else {
            backgroundColor = Colors.transparent;
          }

          return GestureDetector(
            key: ValueKey(index),
            onTap: isDisabled
                ? null
                : () {
                    RevenueCatUIHelper.showPaywallIfNecessary(
                      requiresSubscriptionCallback: () =>
                          widget.onMonthSelected(monthIndex),
                      onPurchased: () => showToast(
                        context: context,
                        message: translations.subscriptionPurchaseSuccessful,
                      ),
                      onRestored: () => showToast(
                        context: context,
                        message: translations.subscriptionPurchaseRestored,
                      ),
                      onError: () => showToast(
                        context: context,
                        message: translations.subscriptionPurchaseFailed,
                        isError: true,
                      ),
                    );
                  },
            child: Container(
              width: _MonthsSelection.monthWidth,
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                left: index == _MonthsSelection.firstMonthIndex
                    ? viewPaddingHorizontal
                    : 0,
                right: index == _MonthsSelection.lastMonthIndex
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
                      fontWeight: monthIndex == widget.selectedMonth
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

  double _getSelectedMonthScrollOffset() {
    final selectedMonthIndex = widget.selectedMonth - 1;
    return math
        .max(
          0,
          (selectedMonthIndex - 1) *
              (_MonthsSelection.monthWidth + horizontalPaddingSmall),
        )
        .toDouble();
  }

  String getMonthName(int month) {
    return Jiffy.parseFromDateTime(DateTime(0, month)).MMM;
  }
}
