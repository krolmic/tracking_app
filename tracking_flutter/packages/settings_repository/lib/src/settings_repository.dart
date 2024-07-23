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

  Future<void> saveCurrency(String currency) async {
    try {
      await _preferences.setString('currency', currency);
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        SettingsRepositoryException(
          message: 'Failed to save currency in shared preferences.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }

  String? getCurrency() {
    try {
      return _preferences.getString('currency');
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
}
