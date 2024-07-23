part of 'calendar_bloc.dart';

@freezed
class CalendarEvent with _$CalendarEvent {
  const factory CalendarEvent.calendarInitialized() =
      _CalendarEventCalendarInitialized;
  const factory CalendarEvent.targetDateChanged({required DateTime date}) =
      _CalendarEventTargetDateChanged;
  const factory CalendarEvent.moodsUpdated() = _CalendarEventMoodsUpdated;
}
