import 'package:account_repository/account_repository.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:email_repository/email_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:tracking_app/app/view/app.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  registerSingletons();

  if (kReleaseMode) {
    await SentryFlutter.init(
      (options) {
        options
          ..dsn = const String.fromEnvironment('SENTRY_DSN')
          ..tracesSampleRate = 1.0;
      },
      appRunner: () => runApp(const App()),
    );
  } else {
    runApp(const App());
  }
}

final GetIt getIt = GetIt.instance;

void registerSingletons() {
  // Third party dependencies
  getIt
    ..registerSingleton<AmplifyClass>(Amplify)
    ..registerSingleton<DataStoreCategory>(Amplify.DataStore)
    ..registerSingleton<AuthCategory>(Amplify.Auth)

    // Repositories
    ..registerLazySingleton<MoodRepository>(
      () => MoodRepository(
        amplifyDatastore: Amplify.DataStore,
      ),
    )
    ..registerLazySingleton<UserProfileRepository>(
      () => UserProfileRepository(
        amplifyAuth: Amplify.Auth,
      ),
    )
    ..registerLazySingleton<AccountRepository>(
      () => AccountRepository(
        amplifyAuth: Amplify.Auth,
      ),
    )
    ..registerLazySingleton<EmailRepository>(
      EmailRepository.new,
    );
}
