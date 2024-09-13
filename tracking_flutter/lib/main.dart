import 'package:account_repository/account_repository.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:email_repository/email_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:graph_settings_repository/graph_settings_repository.dart';
import 'package:legal_repository/legal_repository.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:settings_repository/settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_app/app/view/app.dart';
import 'package:tracking_app/firebase_options.dart';
import 'package:tracking_app/shared/iap/revenue_cat_service.dart';
import 'package:tracking_client/tracking_client.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await registerSingletons();

  runApp(const App());
}

final GetIt getIt = GetIt.instance;

Future<void> registerSingletons() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final serverpodClient = await initServerpodClient();

  getIt
    ..registerSingleton<AmplifyClass>(Amplify)
    ..registerSingleton<AuthCategory>(Amplify.Auth)
    ..registerSingleton<SharedPreferences>(sharedPreferences)
    ..registerSingleton<Client>(serverpodClient)

    // Repositories
    ..registerLazySingleton<MoodRepository>(
      () => MoodRepository(
        serverpodClient: getIt<Client>(),
      ),
    )
    ..registerLazySingleton<UserProfileRepository>(
      () => UserProfileRepository(
        amplifyAuth: getIt<AuthCategory>(),
      ),
    )
    ..registerLazySingleton<AccountRepository>(
      () => AccountRepository(
        amplifyAuth: getIt<AuthCategory>(),
      ),
    )
    ..registerLazySingleton<EmailRepository>(
      EmailRepository.new,
    )
    ..registerLazySingleton<SettingsRepository>(
      () => SettingsRepository(
        preferences: getIt<SharedPreferences>(),
      ),
    )
    ..registerLazySingleton<LegalRepository>(
      LegalRepository.new,
    )
    ..registerLazySingleton<GraphSettingsRepository>(
      () => GraphSettingsRepository(
        preferences: getIt<SharedPreferences>(),
      ),
    )
    ..registerLazySingleton<RevenueCatService>(
      () => RevenueCatService(
        iosApiKey: const String.fromEnvironment('IOS_IAP_API_KEY'),
        androidApiKey: const String.fromEnvironment('ANDROID_IAP_API_KEY'),
      ),
    );
}

Future<Client> initServerpodClient() async {
  final serverpodClient = Client(
    const String.fromEnvironment('API_URL'),
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  await serverpodClient.authenticationKeyManager!
      .put(const String.fromEnvironment('API_KEY'));

  return serverpodClient;
}
