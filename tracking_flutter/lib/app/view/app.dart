import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:settings_repository/settings_repository.dart';
import 'package:tracking_app/app/cubit/app_cubit.dart';
import 'package:tracking_app/app_settings/bloc/app_settings_bloc.dart';
import 'package:tracking_app/auth/view/confirm_reset_password_screen.dart';
import 'package:tracking_app/auth/view/confirm_sign_up_screen.dart';
import 'package:tracking_app/auth/view/reset_password_screen.dart';
import 'package:tracking_app/auth/view/sign_in_screen.dart';
import 'package:tracking_app/auth/view/sign_up_screen.dart';
import 'package:tracking_app/create_mood/bloc/create_mood_bloc.dart';
import 'package:tracking_app/delete_mood/cubit/delete_mood_cubit.dart';
import 'package:tracking_app/l10n/amplify_resolvers.dart';
import 'package:tracking_app/main.dart';
import 'package:tracking_app/onboarding/view/onboarding_screen.dart';
import 'package:tracking_app/shared/iap/revenue_cat_service.dart';
import 'package:tracking_app/shared/router/router.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/theme/theme.dart';
import 'package:tracking_app/shared/widgets/error_message.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';
import 'package:tracking_app/update_mood/bloc/update_mood_bloc.dart';
import 'package:tracking_app/user_profile/cubit/user_profile_cubit.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

part 'widgets/app_error_message.dart';
part 'widgets/app_loading_indicator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(
            amplify: getIt<AmplifyClass>(),
            revenueCatService: getIt<RevenueCatService>(),
            releaseMode: const bool.fromEnvironment('RELEASE_MODE'),
          )..init(),
        ),
        BlocProvider<UserProfileCubit>(
          create: (context) => UserProfileCubit(
            userProfileRepository: getIt<UserProfileRepository>(),
            revenueCatService: getIt<RevenueCatService>(),
          ),
        ),
        BlocProvider<AppSettingsBloc>(
          create: (context) => AppSettingsBloc(
            settingsRepository: getIt<SettingsRepository>(),
          )..add(const AppSettingsEvent.settingsInitialized()),
        ),
        BlocProvider(
          create: (context) => CreateMoodBloc(
            moodRepository: getIt.get<MoodRepository>(),
            userProfileRepository: getIt.get<UserProfileRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => UpdateMoodBloc(
            moodRepository: getIt.get<MoodRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => DeleteMoodCubit(
            moodRepository: getIt.get<MoodRepository>(),
          ),
        ),
      ],
      child: BlocListener<AppSettingsBloc, AppSettingsState>(
        listenWhen: (previous, current) =>
            previous.appSettingsData.preSetRevenue !=
                current.appSettingsData.preSetRevenue ||
            previous.appSettingsData.preSetWorkTime !=
                current.appSettingsData.preSetWorkTime,
        listener: (context, state) {
          if (state.appSettingsData.isSuccess) {
            final appSettings = state.appSettingsData;

            context.read<CreateMoodBloc>().add(
                  CreateMoodEvent.revenueChanged(
                    appSettings.preSetRevenue.toString(),
                  ),
                );

            context.read<CreateMoodBloc>().add(
                  CreateMoodEvent.workTimeChanged(
                    appSettings.preSetWorkTime,
                  ),
                );
          }
        },
        child: Builder(
          builder: (context) {
            final appState = context.select((AppCubit cubit) => cubit.state);
            final appSettingsState = context
                .select((AppSettingsBloc cubit) => cubit.state.appSettingsData);

            final showLoadingIndicator = appState.isInitialOrLoading ||
                appSettingsState.isInitialOrLoading;
            final showError = appState.isError || appSettingsState.isError;

            if (showLoadingIndicator) {
              return const _AppLoadingIndicator();
            } else if (showError) {
              final translations = AppLocalizations.of(context)!;

              return _AppErrorMessage(translations: translations);
            }

            return Authenticator(
              initialStep: AuthenticatorStep.onboarding,
              authenticatorBuilder:
                  (BuildContext context, AuthenticatorState state) {
                if (state.currentStep == AuthenticatorStep.loading) {
                  Jiffy.setLocale(
                    Localizations.localeOf(context).languageCode,
                  );

                  return const Center(
                    child: LoadingIndicator(
                      color: AppColors.primarySwatch,
                    ),
                  );
                } else if (state.currentStep == AuthenticatorStep.onboarding) {
                  return OnboardingScreen(
                    signUpButtonFunction: () => state.changeStep(
                      AuthenticatorStep.signUp,
                    ),
                    signInButtonFunction: () => state.changeStep(
                      AuthenticatorStep.signIn,
                    ),
                  );
                } else if (state.currentStep == AuthenticatorStep.signUp) {
                  return SignUpScreen(
                    onBackButtonPressed: () => state.changeStep(
                      AuthenticatorStep.onboarding,
                    ),
                    onChangeStepPressed: () => state.changeStep(
                      AuthenticatorStep.signIn,
                    ),
                  );
                } else if (state.currentStep ==
                    AuthenticatorStep.confirmSignUp) {
                  return ConfirmSignUpScreen(
                    onBackButtonPressed: () => state.changeStep(
                      AuthenticatorStep.signIn,
                    ),
                  );
                } else if (state.currentStep == AuthenticatorStep.signIn) {
                  return SignInScreen(
                    onBackButtonPressed: () => state.changeStep(
                      AuthenticatorStep.onboarding,
                    ),
                    onChangeStepPressed: () => state.changeStep(
                      AuthenticatorStep.signUp,
                    ),
                  );
                } else if (state.currentStep ==
                    AuthenticatorStep.resetPassword) {
                  return ResetPasswordScreen(
                    onBackButtonPressed: () => state.changeStep(
                      AuthenticatorStep.signIn,
                    ),
                  );
                } else if (state.currentStep ==
                    AuthenticatorStep.confirmResetPassword) {
                  return ConfirmResetPasswordScreen(
                    onBackButtonPressed: () => state.changeStep(
                      AuthenticatorStep.resetPassword,
                    ),
                  );
                }

                return null;
              },
              stringResolver: const AuthStringResolver(
                buttons: LocalizedButtonResolver(),
                inputs: LocalizedInputResolver(),
                messages: LocalizedMessageResolver(),
                titles: LocalizedTitleResolver(),
              ),
              child: MaterialApp.router(
                routerConfig: goRouter,
                debugShowCheckedModeBanner: false,
                builder: Authenticator.builder(),
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                theme: theme,
                themeMode: ThemeMode.light,
              ),
            );
          },
        ),
      ),
    );
  }
}
