import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:tracking_app/gen/assets.gen.dart';
import 'package:tracking_app/shared/constants/layout.dart';

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
      finishButtonText: 'Register',
      finishButtonStyle: const FinishButtonStyle(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      skipTextButton: const Text('Skip'),
      trailing: const Text('Login'),
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
          title: 'Discover a New You',
          subtitle: 'Explore mood tracking and estimate your '
              'mood on daily basis.',
        ),
        _OnboardingSliderPageBody(
          key: const ValueKey('onboarding-slider-body-2'),
          offset: backgroundImageHeight,
          title: 'Cultivate Gratitude, Record Life',
          subtitle: 'Capture gratitude and emotions daily. Show gratitude and '
              "write down what you're grateful for.",
        ),
        _OnboardingSliderPageBody(
          key: const ValueKey('onboarding-slider-body-3'),
          offset: backgroundImageHeight,
          title: 'Empower Your Mind, Find Clarity',
          subtitle: 'Unlock inner peace and mental clarity by journaling '
              'your thoughts in a diary.',
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
    return Padding(
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
