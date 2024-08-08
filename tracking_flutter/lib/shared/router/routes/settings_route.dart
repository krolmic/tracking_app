part of '../router.dart';

final _settingsRoute = GoRoute(
  name: RoutesNames.settings,
  path: '/${RoutesNames.settings}',
  pageBuilder: (context, state) => const NoTransitionPage(
    child: SettingsScreen(),
  ),
  routes: [
    GoRoute(
      name: RoutesNames.updateUserProfile,
      path: RoutesNames.updateUserProfile,
      pageBuilder: (context, state) {
        final parameters = UpdateUserProfileRouteParameters.fromState(state);

        return NoTransitionPage(
          child: UpdateUserProfileScreen(
            email: parameters.email,
            firstName: parameters.firstName,
          ),
        );
      },
    ),
    GoRoute(
      name: RoutesNames.appSettings,
      path: RoutesNames.appSettings,
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
      name: RoutesNames.termsOfService,
      path: RoutesNames.termsOfService,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: TermsOfServiceScreen(),
      ),
    ),
    GoRoute(
      name: RoutesNames.privacyPolicy,
      path: RoutesNames.privacyPolicy,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: PrivacyPolicyScreen(),
      ),
    ),
  ],
);
