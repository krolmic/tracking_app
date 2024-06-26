import 'package:account_repository/account_repository.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:email_repository/email_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:tracking_app/app/view/app.dart';
import 'package:tracking_app/firebase_options.dart';
import 'package:tracking_client/tracking_client.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  registerSingletons();

  runApp(const App());
}

final GetIt getIt = GetIt.instance;

void registerSingletons() {
  // Third party dependencies
  getIt
    ..registerSingleton<AmplifyClass>(Amplify)
    ..registerSingleton<AuthCategory>(Amplify.Auth)

    // Repositories
    ..registerLazySingleton<MoodRepository>(
      () => MoodRepository(
        serverpodClient: Client(
          'http://$localhost:8080/',
          authenticationKeyManager: FlutterAuthenticationKeyManager(),
        )..connectivityMonitor = FlutterConnectivityMonitor(),
      )..init(),
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
