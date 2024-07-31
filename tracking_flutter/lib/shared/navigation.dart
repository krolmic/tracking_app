import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tracking_app/shared/theme/animation.dart';
import 'package:tracking_app/shared/theme/colors.dart';

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
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contentOnDarkBackgroundColor,
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

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    const navigationButtonGradient = LinearGradient(
      colors: [
        gradientColor2,
        gradientColor3,
        gradientColor4,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: contentBackgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          padding: const EdgeInsets.all(10),
          child: GNav(
            rippleColor: darkBlueAccent,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            iconSize: 20,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: animationDuration,
            color: Colors.black,
            tabs: [
              GButton(
                backgroundGradient: navigationButtonGradient,
                icon: activeIndex == 0
                    ? Iconsax.home_bold
                    : Iconsax.home_1_outline,
                iconActiveColor: contentBackgroundColor,
                iconColor: darkBlueAccent,
                textColor: contentOnDarkBackgroundColor,
                text: translations.home,
              ),
              GButton(
                backgroundGradient: navigationButtonGradient,
                icon: activeIndex == 1
                    ? Iconsax.calendar_2_bold
                    : Iconsax.calendar_2_outline,
                iconActiveColor: contentBackgroundColor,
                iconColor: darkBlueAccent,
                textColor: contentOnDarkBackgroundColor,
                text: translations.calendar,
              ),
              GButton(
                backgroundGradient: navigationButtonGradient,
                icon: activeIndex == 2
                    ? Iconsax.activity_bold
                    : Iconsax.activity_outline,
                iconActiveColor: contentBackgroundColor,
                iconColor: darkBlueAccent,
                textColor: contentOnDarkBackgroundColor,
                text: translations.analysis,
              ),
              GButton(
                backgroundGradient: navigationButtonGradient,
                icon: activeIndex == 3
                    ? Iconsax.setting_2_bold
                    : Iconsax.setting_2_outline,
                iconActiveColor: contentBackgroundColor,
                iconColor: darkBlueAccent,
                textColor: contentOnDarkBackgroundColor,
                text: translations.settings,
              ),
            ],
            selectedIndex: activeIndex,
            onTabChange: onTap,
          ),
        ),
      ),
    );
  }
}
