part of '../graph_screen.dart';

class _WeeksSelection extends StatefulWidget {
  const _WeeksSelection({
    required this.numberOfWeeks,
    required this.currentWeek,
    required this.selectedWeek,
    required this.onWeekSelected,
    required this.disableWeeks,
    required this.currentYear,
  });

  final int numberOfWeeks;
  final int currentWeek;
  final int selectedWeek;
  final void Function(int) onWeekSelected;
  final bool disableWeeks;
  final int currentYear;

  static const double weekWidth = 75;

  @override
  State<_WeeksSelection> createState() => _WeeksSelectionState();
}

class _WeeksSelectionState extends State<_WeeksSelection> {
  late ScrollController scrollController;
  int? previousYear;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController(
      initialScrollOffset: _getSelectedWeekScrollOffset(),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelectedWeek();
      previousYear = widget.currentYear;
    });
  }

  @override
  void didUpdateWidget(covariant _WeeksSelection oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Scroll to selected week if year has changed
    if (widget.currentYear != previousYear) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToSelectedWeek();
      });
      previousYear = widget.currentYear;
    }
  }

  void _scrollToSelectedWeek() {
    final scrollOffset = _getSelectedWeekScrollOffset();

    if (scrollController.hasClients) {
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
        itemCount: widget.numberOfWeeks,
        itemBuilder: (context, index) {
          final weekIndex = index + 1;
          final isCurrentWeek = weekIndex == widget.selectedWeek;
          final isDisabled =
              widget.disableWeeks && weekIndex > widget.currentWeek;

          Color textColor;
          if (isCurrentWeek) {
            textColor = AppColors.contentOnDarkBackgroundColor;
          } else if (isDisabled) {
            textColor = AppColors.lightGrey;
          } else {
            textColor = Colors.black;
          }

          Color backgroundColor;
          if (isCurrentWeek) {
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
                          widget.onWeekSelected(weekIndex),
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
              width: _WeeksSelection.weekWidth,
              margin: EdgeInsets.only(
                left: weekIndex == 1 ? viewPaddingHorizontal : 0,
                right: weekIndex == widget.numberOfWeeks
                    ? viewPaddingHorizontal
                    : horizontalPaddingSmall,
                top: horizontalPaddingSmall,
                bottom: horizontalPaddingSmall,
              ),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  translations.calendarWeek(weekIndex),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: textColor,
                        fontWeight: weekIndex == widget.selectedWeek
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  double _getSelectedWeekScrollOffset() {
    final selectedWeekIndex = widget.selectedWeek - 1;
    return math
        .max(
          0,
          (selectedWeekIndex - 1) *
              (_WeeksSelection.weekWidth + horizontalPaddingSmall),
        )
        .toDouble();
  }
}
