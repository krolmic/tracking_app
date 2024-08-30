import 'package:url_launcher/url_launcher.dart';

class EmailRepositoryException implements Exception {
  EmailRepositoryException({
    this.message,
    this.cause,
  });

  final String? message;
  final dynamic cause;

  @override
  String toString() {
    return 'EmailRepositoryException { message: $message, cause: '
        '$cause }';
  }
}

class EmailRepository {
  Future<void> sendEmail({
    required String recipient,
    required String subject,
    required String body,
  }) async {
    try {
      final url = Uri.parse('mailto:$recipient?subject=$subject&body=$body');

      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        EmailRepositoryException(
          message: 'Failed to send email.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }
}
