import 'package:account_repository/account_repository.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:tracking_app/app/view/app.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  registerSingletons();

  await SentryFlutter.init(
    (options) {
      options
        ..dsn =
            'https://4f59af56d06e9abe568d14eb7d532e23@o4506147108093952.ingest.sentry.io/4506147114254336'
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
        // We recommend adjusting this value in production.
        ..tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(const App()),
  );
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
        amplifyDatastore: Amplify.DataStore,
      ),
    );
}
