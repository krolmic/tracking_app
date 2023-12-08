import 'dart:convert';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';

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

class CrashlyticsTree extends LogTree {
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
      // Use message as reason if exception is given.
      FirebaseCrashlytics.instance.recordError(
        ex ?? message,
        // If no stacktrace is given, get custom stacktrace
        // excluding the first 4 lines so Fimber and CrashlyticsTree
        // are excluded.
        stacktrace ?? _getCustomStackTrace(),
        reason: ex != null ? message : null,
      );
    } else {
      FirebaseCrashlytics.instance.log(message);

      if (ex != null || stacktrace != null) {
        FirebaseCrashlytics.instance
            .log('exception: $ex, stacktrace: $stacktrace');
      }
    }
  }

  StackTrace _getCustomStackTrace() {
    final currentStackTraceAsString = StackTrace.current.toString();
    final currentStackTraceLines =
        const LineSplitter().convert(currentStackTraceAsString).toList();
    final cleanedStackTraceLines = currentStackTraceLines..removeRange(0, 4);
    return StackTrace.fromString(cleanedStackTraceLines.join('\n'));
  }
}
