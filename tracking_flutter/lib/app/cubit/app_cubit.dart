import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tracking_app/amplify_outputs.dart'
    as amplify_config_development;
import 'package:tracking_app/amplify_outputs_production.dart'
    as amplify_config_production;
import 'package:tracking_app/shared/iap/revenue_cat_service.dart';
import 'package:tracking_app/shared/logging.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({
    required AmplifyClass amplify,
    required this.releaseMode,
    required RevenueCatService revenueCatService,
  })  : _amplify = amplify,
        _revenueCatService = revenueCatService,
        super(const AppState.initial());

  final AmplifyClass _amplify;
  final RevenueCatService _revenueCatService;
  final bool releaseMode;

  Future<void> init() async {
    emit(const AppState.loading());

    await _configureLogging();

    try {
      await _configureAmplify();
      await _revenueCatService.initialize();

      emit(const AppState.success());
    } catch (e, stackTrace) {
      Fimber.e(
        "Failed to initialise app's state.",
        ex: e,
        stacktrace: stackTrace,
      );

      emit(const AppState.error());
    }
  }

  Future<void> _configureAmplify() async {
    final auth = AmplifyAuthCognito();

    await _amplify.addPlugins([
      auth,
    ]);

    await _amplify.configure(
      releaseMode
          ? amplify_config_production.amplifyConfig
          : amplify_config_development.amplifyConfig,
    );
  }

  Future<void> _configureLogging() async {
    if (releaseMode) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;

      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack);
        return true;
      };

      Fimber.plantTree(CrashlyticsTree());
    } else if (kDebugMode) {
      Fimber.plantTree(
        DebugTree(
          logLevels: DebugTree.defaultLevels.toList()..add('V'),
          useColors: true,
        ),
      );

      Bloc.observer = LoggingBlocObserver();
    }
  }
}
