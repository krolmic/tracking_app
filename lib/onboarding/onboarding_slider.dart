import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:tracking_app/gen/assets.gen.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/theme/layout.dart';

class OnboardingSlider extends StatelessWidget {
  const OnboardingSlider({
    required this.signUpButtonFunction,
    required this.signInButtonFunction,
    super.key,
  });

  final Function signUpButtonFunction;
  final Function signInButtonFunction;

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    final mediaQuery = MediaQuery.of(context);
    final screenPadding = mediaQuery.padding;
    final screenHeight =
        mediaQuery.size.height - screenPadding.top - screenPadding.bottom;

    final backgroundImageHeight = screenHeight / 2;

    return OnBoardingSlider(
      imageVerticalOffset: verticalPaddingLarge,
      trailingFunction: signInButtonFunction,
      onFinish: signUpButtonFunction,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: lightBackgroundColor,
      finishButtonText: translations.signUp,
      finishButtonStyle: const FinishButtonStyle(
        backgroundColor: primarySwatch,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
      skipTextButton: Text(translations.skip),
      trailing: Text(translations.signIn),
      background: [
        _OnboardingSliderBackground(
          key: const ValueKey('onboarding-slider-bg-1'),
          assetName: Assets.images.onboardingNamaste.path,
          height: backgroundImageHeight,
        ),
        _OnboardingSliderBackground(
          key: const ValueKey('onboarding-slider-bg-2'),
          assetName: Assets.images.onboardingInhaleExhale.path,
          height: backgroundImageHeight,
        ),
        _OnboardingSliderBackground(
          key: const ValueKey('onboarding-slider-bg-3'),
          assetName: Assets.images.onboardingPresentMoment.path,
          height: backgroundImageHeight,
        ),
      ],
      totalPage: 3,
      speed: 1.8,
      pageBodies: [
        _OnboardingSliderPageBody(
          key: const ValueKey('onboarding-slider-body-1'),
          offset: backgroundImageHeight,
          title: translations.onboardingTextTitle1,
          subtitle: translations.onboardingTextSubtitle1,
        ),
        _OnboardingSliderPageBody(
          key: const ValueKey('onboarding-slider-body-2'),
          offset: backgroundImageHeight,
          title: translations.onboardingTextTitle2,
          subtitle: translations.onboardingTextSubtitle2,
        ),
        _OnboardingSliderPageBody(
          key: const ValueKey('onboarding-slider-body-3'),
          offset: backgroundImageHeight,
          title: translations.onboardingTextTitle3,
          subtitle: translations.onboardingTextSubtitle3,
        ),
      ],
    );
  }
}

class _OnboardingSliderPageBody extends StatelessWidget {
  const _OnboardingSliderPageBody({
    required this.offset,
    required this.title,
    required this.subtitle,
    super.key,
  });

  final double offset;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: viewPaddingHorizontal,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: offset,
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: verticalPaddingLarge,
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: verticalPaddingSmall,
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingSliderBackground extends StatelessWidget {
  const _OnboardingSliderBackground({
    required this.height,
    required this.assetName,
    super.key,
  });

  final double height;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: viewPaddingHorizontal,
        ),
        child: Image.asset(
          assetName,
        ),
      ),
    );
  }
}
