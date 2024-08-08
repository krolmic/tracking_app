part of '../calendar_screen.dart';

class _CalendarTheme {
  _CalendarTheme._();

  static const calendarDaysTextStyle = TextStyle(
    color: Colors.black,
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
    return CalendarCarousel<Event>(
      firstDayOfWeek: (0 + 1) % 7,
      height: 380,
      todayButtonColor: _CalendarTheme.todayButtonColor,
      todayTextStyle: _CalendarTheme.todayTextStyle,
      daysTextStyle: _CalendarTheme.calendarDaysTextStyle,
      prevDaysTextStyle: _CalendarTheme.calendarNextAndPrevDaysTextStyle,
      weekendTextStyle: _CalendarTheme.calendarDaysTextStyle,
      nextDaysTextStyle: _CalendarTheme.calendarNextAndPrevDaysTextStyle,
      headerTextStyle: Theme.of(context).textTheme.headlineSmall,
      rightButtonIcon: const Icon(
        Icons.chevron_right,
        color: _CalendarTheme.calendarPrevAndNextButtonsColor,
      ),
      leftButtonIcon: const Icon(
        Icons.chevron_left,
        color: _CalendarTheme.calendarPrevAndNextButtonsColor,
      ),
      weekdayTextStyle: _CalendarTheme.calendarWeekdaysTextStyle,
      markedDatesMap: _getMarkedDates(),
      targetDateTime: targetMonthDate,
      onCalendarChanged: (date) => context
          .read<CalendarBloc>()
          .add(CalendarEvent.targetDateChanged(date: date)),
      onDayPressed: (date, events) {
        final mood = _getMoodForDate(date);
        final moodAtPressedDayExists = mood != null;

        if (moodAtPressedDayExists) {
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

  Mood? _getMoodForDate(DateTime date) {
    try {
      return moods.firstWhere(
        (mood) => mood.createdOn.isSameDay(date),
      );
    } catch (e) {
      return null;
    }
  }
}
