part of '../calendar_screen.dart';

class _CalendarTheme {
  _CalendarTheme._();

  static const calendarDaysTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const calendarDaysAfterTodayTextStyle = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
  );

  static const todayTextStyle = TextStyle(
    color: AppColors.contentOnDarkBackgroundColor,
    fontWeight: FontWeight.bold,
  );

  static const calendarNextAndPrevDaysTextStyle = TextStyle(
    color: AppColors.lightGrey,
  );

  static const calendarWeekdaysTextStyle = TextStyle(
    color: AppColors.darkBlue,
  );

  static const calendarPrevAndNextButtonsColor = AppColors.primarySwatch;

  static const todayButtonColor = AppColors.primarySwatch;

  static const eventDotDecoration = BoxDecoration(
    shape: BoxShape.circle,
    color: AppColors.darkBlue,
  );
}

class _Calendar extends StatelessWidget {
  const _Calendar({
    required this.moods,
    required this.targetMonthDate,
  });

  final List<Mood> moods;
  final DateTime targetMonthDate;

  void onDayPressed({
    required DateTime date,
    required BuildContext context,
  }) {
    final calendarBloc = context.read<CalendarBloc>();

    final mood = calendarBloc.state.moodsState.getMoodAtCreatedOnDate(date);
    final moodAtPressedDateExists = mood != null;

    if (moodAtPressedDateExists) {
      context.pushNamed(
        RoutesNames.updateMoodFromCalendar,
        extra: UpdateMoodRouteParameters(mood: mood),
      );
    } else {
      context.pushNamed(
        RoutesNames.createMoodFromCalendar,
        extra: CreateMoodRouteParameters(date: date),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;
    final calendarBloc = context.read<CalendarBloc>();

    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: horizontalPaddingLarge),
          child: _CalendarHeader(targetMonthDate: targetMonthDate),
        ),
        const VerticalSpacing.extraLarge(),
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              constraints: const BoxConstraints(
                maxWidth: maxViewWidth,
              ),
              child: CalendarCarousel<Event>(
                firstDayOfWeek: (0 + 1) % 7,
                height: constraints.maxWidth - viewPaddingHorizontal,
                todayButtonColor: _CalendarTheme.todayButtonColor,
                todayTextStyle: _CalendarTheme.todayTextStyle,
                daysTextStyle: _CalendarTheme.calendarDaysTextStyle,
                prevDaysTextStyle:
                    _CalendarTheme.calendarNextAndPrevDaysTextStyle,
                weekendTextStyle: _CalendarTheme.calendarDaysTextStyle,
                nextDaysTextStyle:
                    _CalendarTheme.calendarNextAndPrevDaysTextStyle,
                headerTextStyle: Theme.of(context).textTheme.headlineSmall,
                showHeader: false,
                customDayBuilder: (
                  bool isSelectable,
                  int index,
                  bool isSelectedDay,
                  bool isToday,
                  bool isPrevMonthDay,
                  TextStyle textStyle,
                  bool isNextMonthDay,
                  bool isThisMonthDay,
                  DateTime date,
                ) {
                  if (date.isAfterToday) {
                    return Center(
                      child: Text(
                        '${date.day}',
                        style: _CalendarTheme.calendarDaysAfterTodayTextStyle,
                      ),
                    );
                  }

                  return null;
                },
                weekdayTextStyle: _CalendarTheme.calendarWeekdaysTextStyle,
                markedDatesMap: _getMarkedDates(),
                targetDateTime: targetMonthDate,
                isScrollable: false,
                onCalendarChanged: (date) async {
                  await RevenueCatUIHelper.showPaywallIfNecessary(
                    requiresSubscriptionCallback: () => calendarBloc
                        .add(CalendarEvent.targetDateChanged(date: date)),
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
                onDayPressed: (date, events) async {
                  if (date.isSameMonth(targetMonthDate) &&
                      date.isTodayOrBeforeToday) {
                    await RevenueCatUIHelper.showPaywallIfNecessary(
                      requiresSubscriptionCallback: () {
                        onDayPressed(
                          date: date,
                          context: context,
                        );
                      },
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
                  }
                },
                locale: Localizations.localeOf(context).languageCode,
              ),
            );
          },
        ),
      ],
    );
  }

  EventList<Event> _getMarkedDates() {
    return EventList<Event>(
      events: moods
          .map(
        (mood) => <DateTime, List<Event>>{
          mood.createdOn.dateOnly: [
            Event(
              date: mood.createdOn.dateOnly,
              dot: Container(
                decoration: _CalendarTheme.eventDotDecoration,
                height: 6,
                width: 6,
              ).animate().fadeIn(
                    duration: animationDuration,
                  ),
            ),
          ],
        },
      )
          .fold(
        <DateTime, List<Event>>{},
        (map, event) {
          map.addAll(event);
          return map;
        },
      ),
    );
  }
}

class _CalendarHeader extends StatelessWidget {
  const _CalendarHeader({required this.targetMonthDate});

  final DateTime targetMonthDate;

  Future<void> onButtonPressed({
    required DateTime date,
    required BuildContext context,
  }) async {
    final translations = AppLocalizations.of(context)!;

    await RevenueCatUIHelper.showPaywallIfNecessary(
      requiresSubscriptionCallback: () {
        context
            .read<CalendarBloc>()
            .add(CalendarEvent.targetDateChanged(date: date));
      },
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
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          targetMonthDate.getDateString(null, includeDay: false),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const Spacer(),
        IconButton(
          color: _CalendarTheme.calendarPrevAndNextButtonsColor,
          icon: Icon(
            Iconsax.arrow_left_2_outline,
            size: Theme.of(context).appBarTheme.iconTheme!.size,
          ),
          onPressed: () async {
            await onButtonPressed(
              date: targetMonthDate.previousMonth,
              context: context,
            );
          },
        ),
        const HorizontalSpacing.large(),
        IconButton(
          color: _CalendarTheme.calendarPrevAndNextButtonsColor,
          icon: Icon(
            Iconsax.arrow_right_3_outline,
            size: Theme.of(context).appBarTheme.iconTheme!.size,
          ),
          onPressed: () => onButtonPressed(
            date: targetMonthDate.nextMonth,
            context: context,
          ),
        ),
      ],
    );
  }
}
