import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';
import 'package:tracking_app/app_settings/bloc/app_settings_bloc.dart';
import 'package:tracking_app/app_settings/view/app_settings_screen.dart';
import 'package:tracking_app/calendar/view/calendar_screen.dart';
import 'package:tracking_app/create_mood/bloc/create_mood_bloc.dart';
import 'package:tracking_app/create_mood/view/create_mood_screen.dart';
import 'package:tracking_app/graph/view/graph_screen.dart';
import 'package:tracking_app/home/view/home_screen.dart';
import 'package:tracking_app/moods/view/moods_screen.dart';
import 'package:tracking_app/privacy_policy/view/privacy_policy_screen.dart';
import 'package:tracking_app/settings/view/settings_screen.dart';
import 'package:tracking_app/shared/navigation.dart';
import 'package:tracking_app/shared/router/routes_names.dart';
import 'package:tracking_app/shared/router/routes_parameters.dart';
import 'package:tracking_app/terms_of_service/view/terms_of_service_screen.dart';
import 'package:tracking_app/update_mood/bloc/update_mood_bloc.dart';
import 'package:tracking_app/update_mood/view/update_mood_screen.dart';
import 'package:tracking_app/update_user_profile/view/update_user_profile_screen.dart';

part 'navigators.dart';
part 'routes/calendar_route.dart';
part 'routes/graph_route.dart';
part 'routes/home_route.dart';
part 'routes/settings_route.dart';
part 'routes_page_builders.dart';

final goRouter = GoRouter(
  initialLocation: '/${RoutesNames.home}',
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            _homeRoute,
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCalendarKey,
          routes: [
            _calendarRoute,
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorGraphKey,
          routes: [
            _graphRoute,
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSettingsKey,
          routes: [
            _settingsRoute,
          ],
        ),
      ],
    ),
  ],
);
