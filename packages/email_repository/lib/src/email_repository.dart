import 'package:flutter_email_sender/flutter_email_sender.dart';

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
      final email = Email(
        body: body,
        subject: subject,
        recipients: [recipient],
      );

      await FlutterEmailSender.send(email);
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
