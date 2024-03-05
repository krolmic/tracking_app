import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class AccountRepositoryException implements Exception {
  AccountRepositoryException({
    this.message,
    this.cause,
  });

  final String? message;
  final dynamic cause;

  @override
  String toString() {
    return 'AccountRepositoryException { message: $message, cause: '
        '$cause }';
  }
}

class AccountRepository {
  AccountRepository({
    required AuthCategory amplifyAuth,
  }) : _amplifyAuth = amplifyAuth;

  final AuthCategory _amplifyAuth;

  Future<void> signOut() async {
    try {
      final signOutResult = await _amplifyAuth.signOut();

      if (signOutResult is CognitoFailedSignOut) {
        throw AccountRepositoryException(
          message: signOutResult.exception.toString(),
          cause: signOutResult.exception,
        );
      }
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        AccountRepositoryException(
          message: 'Failed to sign out user.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }

  Future<void> deleteAccount() async {
    try {
      await _amplifyAuth.deleteUser();
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        AccountRepositoryException(
          message: 'Failed to delete user account.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }
}
