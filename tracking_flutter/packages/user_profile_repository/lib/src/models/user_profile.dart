import 'dart:convert';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

@freezed
class UserProfile with _$UserProfile {
  factory UserProfile({
    required String id,
    required String email,
    required String firstName,
    String? picture,
  }) = _UserProfile;

  factory UserProfile.fromUserAttributes(
    List<AuthUserAttribute> userAttributes,
  ) =>
      UserProfileConverter().convert(userAttributes);
}

class UserProfileConverter
    extends Converter<List<AuthUserAttribute>, UserProfile> {
  @override
  UserProfile convert(List<AuthUserAttribute> input) {
    var id = '';
    var email = '';
    var firstName = '';
    var picture = '';

    for (final userAttribute in input) {
      final userAttributeKey = userAttribute.userAttributeKey.key;
      final userAttributeValue = userAttribute.value;

      if (userAttributeKey == 'email') {
        email = userAttributeValue;
      } else if (userAttributeKey == 'sub') {
        id = userAttributeValue;
      } else if (userAttributeKey == 'given_name') {
        firstName = userAttributeValue;
      } else if (userAttributeKey == 'picture') {
        picture = userAttributeValue;
      }
    }

    return UserProfile(
      id: id,
      email: email,
      firstName: firstName,
      picture: picture.isNotEmpty ? picture : null,
    );
  }
}
