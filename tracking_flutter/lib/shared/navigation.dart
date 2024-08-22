import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tracking_app/shared/theme/animation.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/theme/layout.dart';

/// Main navigation widget
class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.contentOnDarkBackgroundColor,
      body: navigationShell,
      bottomNavigationBar: _FloatingBottomNavigationBar(
        key: const ValueKey('FloatingBottomNavigationBar'),
        onTap: _goBranch,
        activeIndex: navigationShell.currentIndex,
      ),
    );
  }
}

class _FloatingBottomNavigationBar extends StatelessWidget {
  const _FloatingBottomNavigationBar({
    required this.onTap,
    required this.activeIndex,
    super.key,
  });

  final dynamic Function(int) onTap;
  final int activeIndex;

  static const navigationButtonGradient = LinearGradient(
    colors: [
      AppColors.gradientColor2,
      AppColors.gradientColor3,
      AppColors.gradientColor4,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const iconActiveColor = AppColors.contentBackgroundColor;
  static final iconColor = AppColors.darkBlueAccent;
  static const textColor = AppColors.contentOnDarkBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    final isSmallScreen = MediaQuery.of(context).size.width <= 375;
    final navigationGap = isSmallScreen ? 6.0 : 8.0;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: viewPaddingHorizontal,
        vertical: verticalPaddingMedium,
      ),
      decoration: BoxDecoration(
        color: AppColors.contentBackgroundColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: AppColors.contentShadowColor,
          ),
        ],
      ),
      child: SafeArea(
        child: GNav(
          rippleColor: AppColors.darkBlueAccent,
          hoverColor: Colors.grey[100]!,
          gap: navigationGap,
          iconSize: 20,
          padding: const EdgeInsets.symmetric(
            horizontal: horizontalPaddingLarge,
            vertical: verticalPaddingMedium,
          ),
          duration: animationDuration,
          color: Colors.black,
          tabs: [
            GButton(
              backgroundGradient: navigationButtonGradient,
              icon:
                  activeIndex == 0 ? Iconsax.home_bold : Iconsax.home_1_outline,
              iconActiveColor: iconActiveColor,
              iconColor: iconColor,
              textColor: textColor,
              text: translations.home,
            ),
            GButton(
              backgroundGradient: navigationButtonGradient,
              icon: activeIndex == 1
                  ? Iconsax.calendar_2_bold
                  : Iconsax.calendar_2_outline,
              iconActiveColor: iconActiveColor,
              iconColor: iconColor,
              textColor: textColor,
              text: translations.calendar,
            ),
            GButton(
              backgroundGradient: navigationButtonGradient,
              icon: activeIndex == 2
                  ? Iconsax.activity_bold
                  : Iconsax.activity_outline,
              iconActiveColor: iconActiveColor,
              iconColor: iconColor,
              textColor: AppColors.contentOnDarkBackgroundColor,
              text: translations.analysis,
            ),
            GButton(
              backgroundGradient: navigationButtonGradient,
              icon: activeIndex == 3
                  ? Iconsax.setting_2_bold
                  : Iconsax.setting_2_outline,
              iconActiveColor: iconActiveColor,
              iconColor: iconColor,
              textColor: textColor,
              text: translations.settings,
            ),
          ],
          selectedIndex: activeIndex,
          onTabChange: onTap,
        ),
      ),
    );
  }
}
