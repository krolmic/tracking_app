part of '../router.dart';

final _homeRoute = GoRoute(
  name: RoutesNames.home,
  path: '/${RoutesNames.home}',
  pageBuilder: (context, state) => const NoTransitionPage(
    child: HomeScreen(),
  ),
  routes: [
    GoRoute(
      name: RoutesNames.createMoodFromHome,
      path: RoutesNames.createMoodFromHome,
      pageBuilder: createMoodRoutePageBuilder,
      onExit: (context, state) {
        toastification.dismissAll();
        return true;
      },
    ),
    GoRoute(
      name: RoutesNames.updateMoodFromHome,
      path: RoutesNames.updateMoodFromHome,
      pageBuilder: updateMoodRoutePageBuilder,
    ),
    GoRoute(
      name: RoutesNames.moods,
      path: RoutesNames.moods,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: MoodsScreen(),
      ),
      routes: [
        GoRoute(
          name: RoutesNames.createMoodFromMoods,
          path: RoutesNames.createMoodFromMoods,
          pageBuilder: createMoodRoutePageBuilder,
          onExit: (context, state) {
            toastification.dismissAll();
            return true;
          },
        ),
        GoRoute(
          name: RoutesNames.updateMoodFromMoods,
          path: RoutesNames.updateMoodFromMoods,
          pageBuilder: updateMoodRoutePageBuilder,
        ),
      ],
    ),
  ],
);
