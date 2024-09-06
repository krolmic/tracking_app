import 'package:graph_settings_repository/graph_settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GraphSettingsRepositoryException implements Exception {
  GraphSettingsRepositoryException({this.message, this.cause});

  final String? message;
  final dynamic cause;

  @override
  String toString() {
    return 'GraphSettingsRepositoryException { message: $message, '
        'cause: $cause }';
  }
}

class GraphSettingsRepository {
  GraphSettingsRepository({required SharedPreferences preferences})
      : _preferences = preferences;

  final SharedPreferences _preferences;

  static const showRevenueDefault = false;
  static const showWorkTimeDefault = true;
  static const timeRangeModeDefault = GraphTimeRangeMode.weekly;

  Future<void> saveShowRevenue({required bool showRevenue}) async {
    try {
      await _preferences.setBool('showRevenue', showRevenue);
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        GraphSettingsRepositoryException(
          message: 'Failed to save show revenue in shared preferences.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }

  Future<void> saveShowWorkTime({required bool showWorkTime}) async {
    try {
      await _preferences.setBool('showWorkTime', showWorkTime);
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        GraphSettingsRepositoryException(
          message: 'Failed to save show work time in shared preferences.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }

  Future<void> saveTimeRangeMode({
    required GraphTimeRangeMode timeRangeMode,
  }) async {
    try {
      await _preferences.setString('timeRangeMode', timeRangeMode.name);
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        GraphSettingsRepositoryException(
          message: 'Failed to save time range mode in shared preferences.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }

  bool readShowRevenue() {
    try {
      return _preferences.getBool('showRevenue') ?? showRevenueDefault;
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        GraphSettingsRepositoryException(
          message: 'Failed to read show revenue from shared preferences.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }

  bool readShowWorkTime() {
    try {
      return _preferences.getBool('showWorkTime') ?? showWorkTimeDefault;
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        GraphSettingsRepositoryException(
          message: 'Failed to read show work time from shared preferences.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }

  GraphTimeRangeMode readTimeRangeMode() {
    try {
      final modeString =
          _preferences.getString('timeRangeMode') ?? timeRangeModeDefault.name;
      return GraphTimeRangeMode.fromString(modeString);
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        GraphSettingsRepositoryException(
          message: 'Failed to read time range mode from shared preferences.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }
}
