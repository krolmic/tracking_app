part of '../router.dart';

final _calendarRoute = GoRoute(
  name: RoutesNames.calendar,
  path: '/${RoutesNames.calendar}',
  pageBuilder: (context, state) => const NoTransitionPage(
    child: CalendarScreen(),
  ),
  routes: [
    GoRoute(
      name: RoutesNames.createMoodFromCalendar,
      path: RoutesNames.createMoodFromCalendar,
      pageBuilder: createMoodRoutePageBuilder,
      onExit: (context, state) {
        toastification.dismissAll();
        return true;
      },
    ),
    GoRoute(
      name: RoutesNames.updateMoodFromCalendar,
      path: RoutesNames.updateMoodFromCalendar,
      pageBuilder: updateMoodRoutePageBuilder,
    ),
  ],
);
