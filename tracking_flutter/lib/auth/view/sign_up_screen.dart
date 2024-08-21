import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tracking_app/auth/view/auth_screen.dart';
import 'package:tracking_app/shared/theme/colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    required this.onBackButtonPressed,
    required this.onChangeStepPressed,
    super.key,
  });

  final VoidCallback onBackButtonPressed;
  final VoidCallback onChangeStepPressed;

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return AuthScreen(
      onBackButtonPressed: onBackButtonPressed,
      body: SignUpForm.custom(
        fields: [
          SignUpFormField.username(),
          SignUpFormField.custom(
            required: true,
            title: translations.givenName,
            attributeKey: CognitoUserAttributeKey.givenName,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return translations.givenNameMustNotBeBlank;
              }
              return null;
            },
          ),
          SignUpFormField.password(),
          SignUpFormField.passwordConfirmation(),
        ],
      ),
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            translations.haveAccount,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.grey,
                ),
          ),
          TextButton(
            onPressed: onChangeStepPressed,
            child: Text(
              translations.signIn,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
