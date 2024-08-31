import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:user_profile_repository/src/models/user_profile.dart'
    as user_profile_repository;

class UserProfileRepositoryException implements Exception {
  UserProfileRepositoryException({
    this.message,
    this.cause,
  });

  final String? message;
  final dynamic cause;

  @override
  String toString() {
    return 'UserProfileRepositoryException { message: $message, cause: '
        '$cause }';
  }
}

class UserProfileRepository {
  UserProfileRepository({
    required AuthCategory amplifyAuth,
  }) : _amplifyAuth = amplifyAuth;

  final AuthCategory _amplifyAuth;

  Future<user_profile_repository.UserProfile> fetchUserProfile() async {
    try {
      final authUserAttributes = await _amplifyAuth.fetchUserAttributes();

      return user_profile_repository.UserProfile.fromUserAttributes(
        authUserAttributes,
      );
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        UserProfileRepositoryException(
          message: 'Failed to get user details.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }

  Future<void> updateUserProfile({
    required String firstName,
  }) async {
    try {
      final attributes = [
        AuthUserAttribute(
          userAttributeKey: AuthUserAttributeKey.givenName,
          value: firstName,
        ),
      ];

      await _amplifyAuth.updateUserAttributes(
        attributes: attributes,
      );
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        UserProfileRepositoryException(
          message: 'Failed to update user details.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }

  Future<String> getCurrentUserId() async {
    try {
      final user = await Amplify.Auth.getCurrentUser();
      return user.userId;
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        UserProfileRepositoryException(
          message: 'Failed to get user id.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }

  Future<void> updateUserPicture(String picture) async {
    try {
      final attributes = [
        AuthUserAttribute(
          userAttributeKey: AuthUserAttributeKey.picture,
          value: picture,
        ),
      ];

      await _amplifyAuth.updateUserAttributes(
        attributes: attributes,
      );
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        UserProfileRepositoryException(
          message: 'Failed to update user picture.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }
}
