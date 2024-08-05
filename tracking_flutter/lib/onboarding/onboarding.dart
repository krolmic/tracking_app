import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tracking_app/shared/theme/animation.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/theme/layout.dart';
import 'package:tracking_app/shared/widgets/app_elevated_button.dart';
import 'package:tracking_app/shared/widgets/spacing.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({
    required this.signUpButtonFunction,
    super.key,
  });

  final VoidCallback signUpButtonFunction;

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    const pagesBodyPadding = EdgeInsets.symmetric(
      horizontal: horizontalPaddingLarge,
    );

    return OnboadingSlider(
      onPressedOnLastPage: signUpButtonFunction,
      pages: [
        WhatsNewPage(
          bodyPadding: pagesBodyPadding,
          title: Text(
            translations.namaste,
            style: Theme.of(context).textTheme.headlineLarge,
          ).animate().fadeIn(duration: animationDuration),
          titleTopIndent: verticalPaddingExtraLarge,
          titleToBodySpacing: verticalPaddingExtraLarge,
          features: [
            Text(
              translations.appDescription,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ).animate().fadeIn(duration: animationDuration),
            const VerticalSpacing.large(),
            WhatsNewFeature(
              icon: const Icon(
                Iconsax.heart_add_outline,
                color: primarySwatch,
              ),
              title: Text(
                translations.trackYourMood,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              description: Text(
                translations.trackYourMoodDescription,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: grey,
                    ),
              ),
            )
                .animate()
                .fadeIn(duration: animationDuration, delay: animationDuration),
            WhatsNewFeature(
              icon: const Icon(
                Iconsax.money_4_outline,
                color: primarySwatch,
              ),
              title: Text(
                translations.trackYourWork,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              description: Text(
                translations.trackYourWorkDescription,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: grey,
                    ),
              ),
            )
                .animate()
                .fadeIn(duration: animationDuration, delay: animationDuration),
          ],
        ),
        WhatsNewPage(
          titleTopIndent: verticalPaddingExtraLarge,
          bodyPadding: pagesBodyPadding,
          title: Text(
            translations.sayHelloToCalendar,
            style: Theme.of(context).textTheme.headlineLarge,
          ).animate().fadeIn(duration: animationDuration),
          features: [
            WhatsNewFeature(
              icon: const Icon(
                Iconsax.calendar_tick_outline,
                color: primarySwatch,
              ),
              title: Text(
                translations.monthlyOverview,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              description: Text(
                translations.monthlyOverviewDescription,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: grey,
                    ),
              ),
            ),
            WhatsNewFeature(
              icon: const Icon(
                Iconsax.calendar_edit_outline,
                color: primarySwatch,
              ),
              title: Text(
                translations.updateDays,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              description: Text(
                translations.updateDaysDescription,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: grey,
                    ),
              ),
            ),
            WhatsNewFeature(
              icon: const Icon(
                Iconsax.calendar_add_outline,
                color: primarySwatch,
              ),
              title: Text(
                translations.addMissedDays,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              description: Text(
                translations.addMissedDaysDescription,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: grey,
                    ),
              ),
            ),
          ]
              .animate()
              .fadeIn(duration: animationDuration, delay: animationDuration),
        ),
        WhatsNewPage(
          titleTopIndent: verticalPaddingExtraLarge,
          bodyPadding: pagesBodyPadding,
          title: Text(
            translations.giveVisitToAnalysis,
            style: Theme.of(context).textTheme.headlineLarge,
          ).animate().fadeIn(duration: animationDuration),
          features: [
            WhatsNewFeature(
              icon: const Icon(
                Iconsax.diagram_outline,
                color: primarySwatch,
              ),
              title: Text(
                translations.analyzeYourProgress,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              description: Text(
                translations.analyzeYourProgressDescription,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: grey,
                    ),
              ),
            ),
            WhatsNewFeature(
              icon: const Icon(
                Iconsax.data_outline,
                color: primarySwatch,
              ),
              title: Text(
                translations.showTrackedData,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              description: Text(
                translations.showTrackedDataDescription,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: grey,
                    ),
              ),
            ),
            WhatsNewFeature(
              icon: const Icon(
                Iconsax.trend_up_outline,
                color: primarySwatch,
              ),
              title: Text(
                translations.getHighestValues,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              description: Text(
                translations.getHighestValuesDescription,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: grey,
                    ),
              ),
            ),
          ]
              .animate()
              .fadeIn(duration: animationDuration, delay: animationDuration),
        ),
      ],
    );
  }
}

class OnboadingSlider extends StatefulWidget {
  const OnboadingSlider({
    required this.onPressedOnLastPage,
    required this.pages,
    super.key,
  });

  final List<Widget> pages;

  final VoidCallback onPressedOnLastPage;

  @override
  State<OnboadingSlider> createState() => _OnboadingSliderState();
}

class _OnboadingSliderState extends State<OnboadingSlider> {
  late final PageController _pageController;

  int _currentPage = 0;
  double _currentPageAsDouble = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currentPageAsDouble = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    final isLastPage = _currentPage == widget.pages.length - 1;

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const BouncingScrollPhysics(),
              controller: _pageController,
              children: widget.pages,
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page;
                });
              },
            ),
          ),
          if (widget.pages.length > 1)
            DotsIndicator(
              dotsCount: widget.pages.length,
              position: _currentPageAsDouble,
              decorator: dotsDecorator,
            ),
          const VerticalSpacing.large(),
          Center(
            child: AppElevatedButton(
              isLoading: false,
              label:
                  isLastPage ? translations.signUp : translations.continueLabel,
              onPressed:
                  isLastPage ? widget.onPressedOnLastPage : _animateToNextPage,
            ),
          ),
          const VerticalSpacing.extraLarge(),
        ],
      ),
    );
  }

  Future<void> _animateToNextPage() async {
    await _pageController.nextPage(
      duration: animationDuration,
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }
}
