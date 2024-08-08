import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tracking_app/auth/view/auth_screen.dart';
import 'package:tracking_app/shared/theme/colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
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
      body: SignInForm(),
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            translations.noAccount,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.grey,
                ),
          ),
          TextButton(
            onPressed: onChangeStepPressed,
            child: Text(
              translations.signUp,
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
