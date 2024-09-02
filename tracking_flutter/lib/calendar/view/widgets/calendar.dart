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

  static const calendarPrevAndNextButtonsColor = AppColors.grey;

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

  @override
  Widget build(BuildContext context) {
    final calendarBloc = context.read<CalendarBloc>();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 2),
          child: _CalendarHeader(targetMonthDate: targetMonthDate),
        ),
        const VerticalSpacing.extraLarge(),
        CalendarCarousel<Event>(
          firstDayOfWeek: (0 + 1) % 7,
          height: 350,
          todayButtonColor: _CalendarTheme.todayButtonColor,
          todayTextStyle: _CalendarTheme.todayTextStyle,
          daysTextStyle: _CalendarTheme.calendarDaysTextStyle,
          prevDaysTextStyle: _CalendarTheme.calendarNextAndPrevDaysTextStyle,
          weekendTextStyle: _CalendarTheme.calendarDaysTextStyle,
          nextDaysTextStyle: _CalendarTheme.calendarNextAndPrevDaysTextStyle,
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
          onCalendarChanged: (date) =>
              calendarBloc.add(CalendarEvent.targetDateChanged(date: date)),
          onDayPressed: (date, events) {
            final mood =
                calendarBloc.state.moodsState.getMoodAtCreatedOnDate(date);
            final moodAtPressedDateExists = mood != null;

            if (moodAtPressedDateExists) {
              context.pushNamed(
                RoutesNames.updateMoodFromCalendar,
                extra: UpdateMoodRouteParameters(mood: mood),
              );
            } else if (date.isSameMonth(targetMonthDate) &&
                date.isTodayOrBeforeToday) {
              context.pushNamed(
                RoutesNames.createMoodFromCalendar,
                extra: CreateMoodRouteParameters(date: date),
              );
            }
          },
          locale: Localizations.localeOf(context).languageCode,
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
                margin: const EdgeInsets.symmetric(horizontal: 1),
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

  @override
  Widget build(BuildContext context) {
    final calendarBloc = context.read<CalendarBloc>();

    return Row(
      children: [
        Text(
          targetMonthDate.getDateString(null, includeDay: false),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const Spacer(),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => calendarBloc.add(
              CalendarEvent.targetDateChanged(
                date: targetMonthDate.previousMonth,
              ),
            ),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(
                left: 7,
                right: 8,
                top: 8,
                bottom: 8,
              ),
              child: Icon(
                Iconsax.arrow_left_2_outline,
                color: _CalendarTheme.calendarPrevAndNextButtonsColor,
                size: Theme.of(context).appBarTheme.iconTheme!.size,
              ),
            ),
          ),
        ),
        const HorizontalSpacing.large(),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => calendarBloc.add(
              CalendarEvent.targetDateChanged(
                date: targetMonthDate.nextMonth,
              ),
            ),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              child: Icon(
                Iconsax.arrow_right_3_outline,
                color: _CalendarTheme.calendarPrevAndNextButtonsColor,
                size: Theme.of(context).appBarTheme.iconTheme!.size,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
