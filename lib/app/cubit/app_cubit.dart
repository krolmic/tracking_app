import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/amplifyconfiguration.dart';
import 'package:tracking_app/shared/logging.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({
    required AmplifyClass amplify,
  })  : _amplify = amplify,
        super(const AppState.initial());

  final AmplifyClass _amplify;

  Future<void> init() async {
    emit(const AppState.loading());

    await _configureLogging();

    try {
      await _configureAmplify();
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
    final datastore = AmplifyDataStore(
      modelProvider: ModelProvider.instance,
    );
    final api = AmplifyAPI();

    final auth = AmplifyAuthCognito();

    await _amplify.addPlugins([
      datastore,
      api,
      auth,
    ]);
    await _amplify.configure(amplifyconfig);
  }

  Future<void> _configureLogging() async {
    if (kReleaseMode) {
      Fimber.plantTree(SentryTree());
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
