import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tracking_app/app/cubit/app_cubit.dart';
import 'package:tracking_app/l10n/amplify_resolvers.dart';
import 'package:tracking_app/main.dart';
import 'package:tracking_app/shared/constants/colors.dart';
import 'package:tracking_app/shared/router.dart';
import 'package:tracking_app/shared/widgets/error_message.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';
import 'package:tracking_app/user_profile/cubit/user_profile_cubit.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    safePrint(AppLocalizations.supportedLocales.toString());

    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(
            amplify: getIt<AmplifyClass>(),
          )..init(),
        ),
        BlocProvider<UserProfileCubit>(
          create: (context) => UserProfileCubit(
            userProfileRepository: getIt<UserProfileRepository>(),
          ),
        ),
      ],
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if (state.isInitialOrLoading) {
            return const ColoredBox(
              color: Colors.white,
              child: LoadingIndicator(),
            );
          } else if (state.isError) {
            return const ColoredBox(
              color: Colors.white,
              child: ErrorMessage(
                message: "Initialising app's state failed.",
              ),
            );
          }

          return Authenticator(
            stringResolver: const AuthStringResolver(
              buttons: LocalizedButtonResolver(),
              inputs: LocalizedInputResolver(),
              messages: LocalizedMessageResolver(),
              titles: LocalizedTitleResolver(),
              // DialCodeResolver? dialCodes,
              // InstructionsResolver? instructions,
            ),
            signUpForm: SignUpForm.custom(
              fields: [
                // SignUpFormField.username(),
                SignUpFormField.email(required: true),
                SignUpFormField.givenName(required: true),
                SignUpFormField.password(),
                SignUpFormField.passwordConfirmation(),
              ],
            ),
            signInForm: SignInForm.custom(
              fields: [
                SignInFormField.username(),
                SignInFormField.password(),
              ],
            ),
            child: MaterialApp.router(
              routerConfig: goRouter,
              debugShowCheckedModeBanner: false,
              builder: Authenticator.builder(),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              theme: ThemeData.from(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: primarySwatch,
                ),
              ),
              darkTheme: ThemeData.from(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: primarySwatch,
                  backgroundColor: Colors.black,
                  brightness: Brightness.dark,
                ),
              ),
              themeMode: ThemeMode.light,
            ),
          );
        },
      ),
    );
  }
}
