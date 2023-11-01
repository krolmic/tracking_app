import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/create_mood/view/create_mood_screen.dart';
import 'package:tracking_app/home/view/home_screen.dart';
import 'package:tracking_app/settings/view/settings_screen.dart';
import 'package:tracking_app/shared/navigation.dart';
import 'package:tracking_app/update_mood/view/update_mood_screen.dart';
import 'package:tracking_app/update_user_profile/view/update_user_profile_screen.dart';

// private GoRouter navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorSettingsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellSettings');

/// app GoRouter instance
final goRouter = GoRouter(
  initialLocation: '/home',
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
            GoRoute(
              name: 'home',
              path: '/home',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AuthenticatedView(
                  child: HomeScreen(),
                ),
              ),
              routes: [
                GoRoute(
                  name: 'create',
                  path: 'create',
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: AuthenticatedView(
                      child: CreateMoodScreen(),
                    ),
                  ),
                ),
                GoRoute(
                  name: 'update',
                  path: 'update',
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: AuthenticatedView(
                      child: UpdateMoodScreen(
                        mood: state.extra! as Mood,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSettingsKey,
          routes: [
            GoRoute(
              name: 'settings',
              path: '/settings',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SettingsScreen(),
              ),
              routes: [
                GoRoute(
                  name: 'update-user-profile',
                  path: 'update-user-profile',
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: UpdateUserProfileScreen(
                      email: (state.extra! as UpdateUserProfileParams).email,
                      firstName:
                          (state.extra! as UpdateUserProfileParams).firstName,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

@immutable
class UpdateUserProfileParams {
  const UpdateUserProfileParams({
    required this.email,
    required this.firstName,
  });

  final String email;
  final String firstName;
}
