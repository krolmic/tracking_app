import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepositoryException implements Exception {
  SettingsRepositoryException({
    this.message,
    this.cause,
  });

  final String? message;
  final dynamic cause;

  @override
  String toString() {
    return 'SettingsRepositoryException { message: $message, cause: '
        '$cause }';
  }
}

class SettingsRepository {
  SettingsRepository({
    required SharedPreferences preferences,
  }) : _preferences = preferences;

  final SharedPreferences _preferences;

  Future<void> saveAppSettings({
    required String currency,
    required Duration workTime,
    required double revenue,
  }) async {
    try {
      await Future.wait([
        _saveCurrency(currency),
        _savePreSetWorkTime(workTime),
        _savePreSetRevenue(revenue),
      ]);
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        SettingsRepositoryException(
          message: 'Failed to save app settings in shared preferences.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }

  Future<void> _savePreSetRevenue(double revenue) async {
    await _preferences.setDouble('preSetRevenue', revenue);
  }

  Future<void> _saveCurrency(String currency) async {
    await _preferences.setString('currency', currency);
  }

  Future<void> _savePreSetWorkTime(Duration workTime) async {
    await Future.wait([
      _savePreSetWorkTimeHours(workTime.inHours),
      _savePreSetWorkTimeMinutes(workTime.inMinutes % 60),
    ]);
  }

  Future<void> _savePreSetWorkTimeHours(int hours) async {
    await _preferences.setInt('preSetWorkTimeHours', hours);
  }

  Future<void> _savePreSetWorkTimeMinutes(int minutes) async {
    await _preferences.setInt('preSetWorkTimeMinutes', minutes);
  }

  String readCurrency() {
    try {
      return _preferences.getString('currency') ?? 'USD';
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        SettingsRepositoryException(
          message: 'Failed to read currency from shared preferences.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }

  double readPreSetRevenue() {
    try {
      return _preferences.getDouble('preSetRevenue') ?? 0.0;
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        SettingsRepositoryException(
          message: 'Failed to read preset revenue from shared preferences.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }

  Duration readPreSetWorkTime() {
    final hours = _readPreSetWorkTimeHours();
    final minutes = _readPreSetWorkTimeMinutes();
    return Duration(hours: hours, minutes: minutes);
  }

  int _readPreSetWorkTimeHours() {
    try {
      return _preferences.getInt('preSetWorkTimeHours') ?? 0;
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        SettingsRepositoryException(
          message:
              'Failed to read preset work time hours from shared preferences.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }

  int _readPreSetWorkTimeMinutes() {
    try {
      return _preferences.getInt('preSetWorkTimeMinutes') ?? 0;
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        SettingsRepositoryException(
          message: 'Failed to read '
              'preset work time minutes from shared preferences.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }
}
