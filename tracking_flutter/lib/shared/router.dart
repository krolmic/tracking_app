import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_repository/mood_repository.dart';
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
import 'package:tracking_app/terms_of_service/view/terms_of_service_screen.dart';
import 'package:tracking_app/update_mood/bloc/update_mood_bloc.dart';
import 'package:tracking_app/update_mood/view/update_mood_screen.dart';
import 'package:tracking_app/update_user_profile/view/update_user_profile_screen.dart';

// private GoRouter navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorCalendarKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellCalendar');
final _shellNavigatorGraphKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellGraph');
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
                  name: 'create-mood-from-home',
                  path: 'create',
                  pageBuilder: (context, state) {
                    context.read<CreateMoodBloc>().add(
                          CreateMoodEvent.dateChanged(DateTime.now()),
                        );

                    return const NoTransitionPage(
                      child: AuthenticatedView(
                        child: CreateMoodScreen(),
                      ),
                    );
                  },
                ),
                GoRoute(
                  name: 'update-mood-from-home',
                  path: 'update',
                  pageBuilder: (context, state) {
                    final mood = state.extra! as Mood;
                    context.read<UpdateMoodBloc>().add(
                          UpdateMoodEvent.moodSelected(mood),
                        );

                    return NoTransitionPage(
                      child: AuthenticatedView(
                        child: UpdateMoodScreen(
                          routeOrigin: 'home',
                          moodDate: mood.createdOn,
                        ),
                      ),
                    );
                  },
                ),
                GoRoute(
                  name: 'moods',
                  path: 'moods',
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: AuthenticatedView(
                      child: MoodsScreen(),
                    ),
                  ),
                  routes: [
                    GoRoute(
                      name: 'create-mood-from-moods',
                      path: 'create',
                      pageBuilder: (context, state) {
                        context.read<CreateMoodBloc>().add(
                              CreateMoodEvent.dateChanged(DateTime.now()),
                            );

                        return const NoTransitionPage(
                          child: AuthenticatedView(
                            child: CreateMoodScreen(),
                          ),
                        );
                      },
                    ),
                    GoRoute(
                      name: 'update-mood-from-moods',
                      path: 'update',
                      pageBuilder: (context, state) {
                        final mood = state.extra! as Mood;
                        context.read<UpdateMoodBloc>().add(
                              UpdateMoodEvent.moodSelected(mood),
                            );

                        return NoTransitionPage(
                          child: AuthenticatedView(
                            child: UpdateMoodScreen(
                              routeOrigin: 'moods',
                              moodDate: mood.createdOn,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCalendarKey,
          routes: [
            GoRoute(
              name: 'calendar',
              path: '/calendar',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AuthenticatedView(
                  child: CalendarScreen(),
                ),
              ),
              routes: [
                GoRoute(
                  name: 'create-mood-from-calendar',
                  path: 'create',
                  pageBuilder: (context, state) {
                    if (state.extra != null) {
                      final date = state.extra! as DateTime;
                      context.read<CreateMoodBloc>().add(
                            CreateMoodEvent.dateChanged(date),
                          );
                    }

                    return const NoTransitionPage(
                      child: AuthenticatedView(
                        child: CreateMoodScreen(),
                      ),
                    );
                  },
                ),
                GoRoute(
                  name: 'update-mood-from-calendar',
                  path: 'update',
                  pageBuilder: (context, state) {
                    final mood = state.extra! as Mood;
                    context.read<UpdateMoodBloc>().add(
                          UpdateMoodEvent.moodSelected(mood),
                        );

                    return NoTransitionPage(
                      child: AuthenticatedView(
                        child: UpdateMoodScreen(
                          routeOrigin: 'calendar',
                          moodDate: mood.createdOn,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorGraphKey,
          routes: [
            GoRoute(
              name: 'graph',
              path: '/graph',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: GraphScreen(),
              ),
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
                GoRoute(
                  name: 'app-settings',
                  path: 'app-settings',
                  pageBuilder: (context, state) {
                    context
                        .read<AppSettingsBloc>()
                        .add(const AppSettingsEvent.settingsFormInitialized());

                    return const NoTransitionPage(
                      child: AppSettingsScreen(),
                    );
                  },
                ),
                GoRoute(
                  name: 'terms-of-service',
                  path: 'terms-of-service',
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: TermsOfServiceScreen(),
                  ),
                ),
                GoRoute(
                  name: 'privacy-policy',
                  path: 'privacy-policy',
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: PrivacyPolicyScreen(),
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
