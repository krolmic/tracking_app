part of '../router.dart';

final _graphRoute = GoRoute(
  name: RoutesNames.graph,
  path: '/${RoutesNames.graph}',
  pageBuilder: (context, state) => const NoTransitionPage(
    child: GraphScreen(),
  ),
);
