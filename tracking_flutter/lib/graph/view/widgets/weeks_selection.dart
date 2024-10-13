part of '../graph_screen.dart';

class _WeeksSelection extends StatelessWidget {
  const _WeeksSelection({
    required this.numberOfWeeks,
    required this.currentWeek,
    required this.selectedWeek,
    required this.onWeekSelected,
    required this.disableWeeks,
  });

  final int numberOfWeeks;
  final int currentWeek;
  final int selectedWeek;
  final void Function(int) onWeekSelected;
  final bool disableWeeks;

  static const double weekWidth = 75;

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    final selectedWeekIndex = selectedWeek - 1;

    // Scroll to the month before the selected week so that
    // user is able to select it without scrolling
    final scrollController = ScrollController(
      initialScrollOffset:
          (selectedWeekIndex - 1) * (weekWidth + horizontalPaddingSmall),
    );

    return SizedBox(
      height: 50,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: numberOfWeeks,
        itemBuilder: (context, index) {
          final weekIndex = index + 1;
          final isCurrentWeek = weekIndex == selectedWeek;
          final isDisabled = disableWeeks && weekIndex > currentWeek;

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
                          onWeekSelected(weekIndex),
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
              width: weekWidth,
              margin: EdgeInsets.only(
                left: weekIndex == 1 ? viewPaddingHorizontal : 0,
                right: weekIndex == numberOfWeeks
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
                        fontWeight: weekIndex == selectedWeek
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
}
