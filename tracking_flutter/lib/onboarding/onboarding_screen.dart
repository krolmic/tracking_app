import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tracking_app/onboarding/onboarding.dart';
import 'package:tracking_app/shared/theme/layout.dart';
import 'package:tracking_app/shared/view/base_view.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    required this.signInButtonFunction,
    required this.signUpButtonFunction,
    super.key,
  });

  final VoidCallback signUpButtonFunction;
  final VoidCallback signInButtonFunction;

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: viewPaddingHorizontal),
            child: TextButton(
              onPressed: signInButtonFunction,
              child: Text(translations.signIn),
            ),
          ),
        ],
      ),
      body: BaseView(
        child: Onboarding(
          signUpButtonFunction: signUpButtonFunction,
        ),
      ),
    );
  }
}
