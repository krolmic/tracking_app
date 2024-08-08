import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tracking_app/shared/theme/animation.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/theme/layout.dart';
import 'package:tracking_app/shared/view/base_view.dart';
import 'package:tracking_app/shared/widgets/app_dots_indicator.dart';
import 'package:tracking_app/shared/widgets/app_elevated_button.dart';
import 'package:tracking_app/shared/widgets/spacing.dart';

part 'widgets/onboarding.dart';

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
        child: _Onboarding(
          signUpButtonFunction: signUpButtonFunction,
        ),
      ),
    );
  }
}
