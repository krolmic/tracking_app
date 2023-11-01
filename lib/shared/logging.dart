import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class LoggingBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    Fimber.v('Creating instance of ${bloc.runtimeType}');

    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    Fimber.v(event.toString());

    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    Fimber.v('${change.nextState}');

    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    Fimber.e(
      'Error in ${bloc.runtimeType}',
      ex: error,
      stacktrace: stackTrace,
    );

    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    Fimber.v('Closing instance of ${bloc.runtimeType}');

    super.onClose(bloc);
  }
}

class SentryTree extends LogTree {
  @override
  List<String> getLevels() => ['I', 'W', 'E'];

  @override
  void log(
    String level,
    String message, {
    String? tag,
    dynamic ex,
    StackTrace? stacktrace,
  }) {
    if (level == 'E') {
      Sentry.captureException(
        ex ?? message,
        stackTrace: stacktrace,
      );
    } else {
      Sentry.captureMessage(message);

      if (ex != null || stacktrace != null) {
        Sentry.captureMessage('exception: $ex, stacktrace: $stacktrace');
      }
    }
  }
}
