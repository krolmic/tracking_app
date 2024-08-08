import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/auth/view/auth_screen.dart';

class ConfirmResetPasswordScreen extends StatelessWidget {
  const ConfirmResetPasswordScreen({
    required this.onBackButtonPressed,
    super.key,
  });

  final VoidCallback onBackButtonPressed;

  @override
  Widget build(BuildContext context) {
    return AuthScreen(
      onBackButtonPressed: onBackButtonPressed,
      body: const ConfirmResetPasswordForm(),
    );
  }
}
