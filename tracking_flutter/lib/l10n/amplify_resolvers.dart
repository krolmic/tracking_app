import 'package:amplify_authenticator/amplify_authenticator.dart';
// ignore: implementation_imports
import 'package:amplify_authenticator/src/utils/unmet_password_requirements.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart' as intl;

class LocalizedButtonResolver extends ButtonResolver {
  const LocalizedButtonResolver();

  /// Override the signin function with a localized value
  @override
  String signIn(BuildContext context) {
    return AppLocalizations.of(context)!.signIn;
  }

  /// Label of sign up form button
  @override
  String signUp(BuildContext context) {
    return AppLocalizations.of(context)!.signUp;
  }

  /// Label of confirm forms' button
  @override
  String confirm(BuildContext context) {
    return AppLocalizations.of(context)!.confirm;
  }

  /// Label of confirm forms' button
  @override
  String continueLabel(BuildContext context) {
    return AppLocalizations.of(context)!.continueLabel;
  }

  /// Label of submit button
  @override
  String submit(BuildContext context) {
    return AppLocalizations.of(context)!.submit;
  }

  /// Label of change password button on ConfirmSignInNewPassword Form
  @override
  String changePassword(BuildContext context) {
    return AppLocalizations.of(context)!.changePassword;
  }

  /// Label of button for sending a confirmation code
  @override
  String sendCode(BuildContext context) {
    return AppLocalizations.of(context)!.sendCode;
  }

  /// Question for button to resend code
  @override
  String lostCode(BuildContext context) {
    return AppLocalizations.of(context)!.lostCode;
  }

  /// Label of button to verify a user after sign in
  @override
  String verify(BuildContext context) {
    return AppLocalizations.of(context)!.verify;
  }

  /// Label of button to sign out the user
  @override
  String signout(BuildContext context) {
    return AppLocalizations.of(context)!.signOut;
  }

  /// Label of button to sign in with a social provider
  @override
  String signInWith(BuildContext context, AuthProvider provider) {
    return AppLocalizations.of(context)!.signInWith(provider.name.capitalized);
  }

  /// Hint text for the 'Go to Sign Up' button
  @override
  String noAccount(BuildContext context) {
    return AppLocalizations.of(context)!.noAccount;
  }

  /// Hint text for the 'Go to Sign In' button
  @override
  String haveAccount(BuildContext context) {
    return AppLocalizations.of(context)!.haveAccount;
  }

  /// Hint text for the 'Go to Reset Password' button
  @override
  String forgotPassword(BuildContext context) {
    return AppLocalizations.of(context)!.forgotPassword;
  }

  /// Label of button to confirm the reset of a user's password
  @override
  String confirmResetPassword(BuildContext context) {
    return AppLocalizations.of(context)!.confirmResetPassword;
  }

  /// Label of button to return to the Sign In step.
  @override
  String backTo(BuildContext context, AuthenticatorStep previousStep) {
    final temp0 = intl.Intl.selectLogic(
      previousStep,
      {
        'signUp': AppLocalizations.of(context)!.signUp,
        'signIn': AppLocalizations.of(context)!.signIn,
        'confirmSignUp': AppLocalizations.of(context)!.confirmSignUp,
        'confirmSignInMfa': AppLocalizations.of(context)!.confirmSignInMfa,
        'confirmSignInNewPassword':
            AppLocalizations.of(context)!.confirmSignInNewPassword,
        'sendCode': AppLocalizations.of(context)!.sendCode,
        'resetPassword': AppLocalizations.of(context)!.resetPassword,
        'verifyUser': AppLocalizations.of(context)!.verifyUser,
        'confirmVerifyUser': AppLocalizations.of(context)!.confirmVerifyUser,
        'other': 'ERROR',
      },
    );
    return AppLocalizations.of(context)!.backTo(temp0);
  }

  /// Label of button to skip the current step or action.
  @override
  String skip(BuildContext context) {
    return AppLocalizations.of(context)!.skip;
  }

  /// Label of button to copy a value.
  @override
  String copyKey(BuildContext context) {
    return AppLocalizations.of(context)!.copyKey;
  }
}

class LocalizedInputResolver extends InputResolver {
  const LocalizedInputResolver();

  /// Returns the label that is displayed as the input title.
  ///
  /// In addition to displaying the input title, this method is
  /// used by the default implmentations of the [hint], [empty] and [format]
  /// methods to resolve the base name of the field.
  @override
  String title(BuildContext context, InputField field) {
    switch (field) {
      case InputField.username:
        return AppLocalizations.of(context)!.username;
      case InputField.password:
        return AppLocalizations.of(context)!.password;
      case InputField.newPassword:
        return AppLocalizations.of(context)!.newPassword;
      case InputField.passwordConfirmation:
        return AppLocalizations.of(context)!.passwordConfirmation;
      case InputField.verificationCode:
        return AppLocalizations.of(context)!.verificationCode;
      case InputField.customAuthChallenge:
        return AppLocalizations.of(context)!.customAuthChallenge;
      case InputField.address:
        return AppLocalizations.of(context)!.address;
      case InputField.birthdate:
        return AppLocalizations.of(context)!.birthdate;
      case InputField.email:
        return AppLocalizations.of(context)!.email;
      case InputField.familyName:
        return AppLocalizations.of(context)!.familyName;
      case InputField.gender:
        return AppLocalizations.of(context)!.gender;
      case InputField.givenName:
        return AppLocalizations.of(context)!.givenName;
      case InputField.middleName:
        return AppLocalizations.of(context)!.middleName;
      case InputField.name:
        return AppLocalizations.of(context)!.name;
      case InputField.nickname:
        return AppLocalizations.of(context)!.nickname;
      case InputField.phoneNumber:
        return AppLocalizations.of(context)!.phoneNumber;
      case InputField.preferredUsername:
        return AppLocalizations.of(context)!.preferredUsername;
      case InputField.rememberDevice:
        return AppLocalizations.of(context)!.rememberDevice;
      case InputField.selectSms:
        return AppLocalizations.of(context)!.selectSms;
      case InputField.selectTotp:
        return AppLocalizations.of(context)!.selectTotp;
      case InputField.totpCodePrompt:
        return AppLocalizations.of(context)!.totpCodePrompt;
      case InputField.usernameType:
        return AppLocalizations.of(context)!.usernameType;
    }
  }

  /// Returns the label displayed as the input hint.
  @override
  String hint(BuildContext context, InputField field) {
    final fieldName = title(context, field);
    return AppLocalizations.of(context)!.promptFill(fieldName);
  }

  /// Returns the hint text used for confirmation fields where the
  /// user is asked to re-enter information prior to form submission.
  @override
  String confirmHint(BuildContext context, InputField field) {
    final fieldName = AppLocalizations.of(context)!.password;
    return AppLocalizations.of(context)!.promptRefill(fieldName);
  }

  /// Returns the text displayed when a required field is left empty.
  @override
  String empty(BuildContext context, InputField field) {
    return AppLocalizations.of(context)!.warnEmpty(title(context, field));
  }

  /// Returns the text displayed when a field fails a format validation check,
  /// such as an invalid email format, an invalid confirmation code length, etc.
  @override
  String format(BuildContext context, InputField field) {
    return AppLocalizations.of(context)!
        .warnInvalidFormat(title(context, field).toLowerCase());
  }

  /// Returns the text displayed when the username requirements are not met
  @override
  String usernameRequires(BuildContext context) {
    return AppLocalizations.of(context)!.usernameRequirements;
  }

  /// Returns the text displayed when a password input does match the password
  /// requirements defined in the amplify configuration.
  @override
  String passwordRequires(
    BuildContext context,
    UnmetPasswordRequirements requirements,
  ) {
    final minLength = requirements.minLength;
    final characterReqs = requirements.characterRequirements;
    if (minLength == null && (characterReqs.isEmpty)) {
      return '';
    }
    final sb = StringBuffer()
      ..writeln(
        AppLocalizations.of(context)!.passwordRequirementsPreamble,
      );
    if (minLength != null) {
      final atLeast = AppLocalizations.of(context)!
          .passwordRequirementsAtLeast(minLength, '');
      sb.writeln('* $atLeast');
    }
    for (final characterReq in characterReqs) {
      final characterType = AppLocalizations.of(context)!
          .passwordRequirementsCharacterType(characterReq.name);
      final atLeast = AppLocalizations.of(context)!
          .passwordRequirementsAtLeast(1, ' $characterType');
      sb.writeln('* $atLeast');
    }
    return sb.toString();
  }

  /// Returns text denoting a field as optional.
  @override
  String optional(BuildContext context, String title) {
    return AppLocalizations.of(context)!.optional(title);
  }
}

class LocalizedMessageResolver extends MessageResolver {
  const LocalizedMessageResolver();

  /// The message that is displayed after a new confirmation code is sent to
  /// [destination].
  @override
  String codeSent(BuildContext context, String destination) {
    return AppLocalizations.of(context)!.codeSent(destination);
  }

  /// The message that is displayed after a new confirmation code is sent via
  /// an unknown delivery medium.
  @override
  String codeSentUnknown(BuildContext context) {
    return AppLocalizations.of(context)!.codeSentUnknown;
  }

  /// The message that is displayed after a TOTP Key was copied to the clipboard
  @override
  String copySucceeded(BuildContext context) {
    return AppLocalizations.of(context)!.copySucceeded;
  }

  /// The message that is displayed after a TOTP Key failed to copy to the
  /// clipboard
  @override
  String copyFailed(BuildContext context) {
    return AppLocalizations.of(context)!.copyFailed;
  }
}

class LocalizedTitleResolver extends TitleResolver {
  const LocalizedTitleResolver();

  /// The title for the confirm sign up Widget.
  @override
  String confirmSignUp(BuildContext context) {
    return AppLocalizations.of(context)!.confirmSignUp;
  }

  /// The title for the confirm sign in (custom auth) Widget.
  @override
  String confirmSignInCustomAuth(BuildContext context) {
    return AppLocalizations.of(context)!.confirmSignInCustomAuth;
  }

  /// The title for the confirm sign in (MFA) Widget.
  @override
  String confirmSignInMfa(BuildContext context) {
    return AppLocalizations.of(context)!.confirmSignInMfa;
  }

  /// The title for the confirm sign in (new passwrod) Widget.
  @override
  String confirmSignInNewPassword(BuildContext context) {
    return AppLocalizations.of(context)!.confirmSignInNewPassword;
  }

  /// The title for the continue sign in (mfa selection) Widget.
  @override
  String continueSignInWithMfaSelection(BuildContext context) {
    return AppLocalizations.of(context)!.continueSignInWithMfaSelection;
  }

  /// The title for the continue sign in (totp setup) Widget.
  @override
  String continueSignInWithTotpSetup(BuildContext context) {
    return AppLocalizations.of(context)!.continueSignInWithTotpSetup;
  }

  /// The title for the confirm sign in (totp MFA code) Widget.
  @override
  String confirmSignInWithTotpMfaCode(BuildContext context) {
    return AppLocalizations.of(context)!.confirmSignInWithTotpMfaCode;
  }

  /// The title for the reset password Widget.
  @override
  String resetPassword(BuildContext context) {
    return AppLocalizations.of(context)!.resetPassword;
  }

  /// The title for the confirm reset password Widget.
  @override
  String confirmResetPassword(BuildContext context) {
    return AppLocalizations.of(context)!.confirmResetPassword;
  }

  /// The title for the verify user Widget.
  @override
  String verifyUser(BuildContext context) {
    return AppLocalizations.of(context)!.verifyUser;
  }
}
