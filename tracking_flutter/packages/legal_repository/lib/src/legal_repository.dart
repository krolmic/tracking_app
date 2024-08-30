import 'package:flutter/services.dart' show rootBundle;

class LegalRepositoryException implements Exception {
  LegalRepositoryException({
    this.message,
    this.cause,
  });

  final String? message;
  final dynamic cause;

  @override
  String toString() {
    return 'LegalRepositoryException { message: $message, cause: '
        '$cause }';
  }
}

class LegalRepository {
  Future<String> getTermsOfService(String languageCode) async {
    try {
      return await rootBundle.loadString(
        'assets/legal/terms_of_service_${languageCode.substring(0, 2)}.html',
      );
    } catch (_) {
      // Fallback to English if the specific language is not found
      try {
        return await rootBundle
            .loadString('assets/legal/terms_of_service_en.html');
      } catch (e, stackTrace) {
        Error.throwWithStackTrace(
          LegalRepositoryException(
            message: 'Failed to load terms of service.',
            cause: e,
          ),
          stackTrace,
        );
      }
    }
  }

  Future<String> getPrivacyPolicy(String languageCode) async {
    try {
      return await rootBundle.loadString(
        'assets/legal/privacy_policy_${languageCode.substring(0, 2)}.html',
      );
    } catch (_) {
      // Fallback to English if the specific language is not found
      try {
        return await rootBundle
            .loadString('assets/legal/privacy_policy_en.html');
      } catch (e, stackTrace) {
        Error.throwWithStackTrace(
          LegalRepositoryException(
            message: 'Failed to load privacy policy.',
            cause: e,
          ),
          stackTrace,
        );
      }
    }
  }
}
