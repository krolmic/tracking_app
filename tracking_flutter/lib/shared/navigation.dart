import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:icons_plus/icons_plus.dart';

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
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          padding: const EdgeInsets.all(10),
          child: GNav(
            rippleColor: Colors.black12,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.black,
            tabs: [
              GButton(
                backgroundColor: Colors.deepPurple,
                icon: activeIndex == 0
                    ? Iconsax.home_bold
                    : Iconsax.home_1_outline,
                iconActiveColor: Colors.white,
                iconColor: Colors.black38,
                textColor: Colors.white,
                text: translations.home,
              ),
              GButton(
                backgroundColor: Colors.deepPurple,
                icon: activeIndex == 1
                    ? Iconsax.calendar_2_bold
                    : Iconsax.calendar_2_outline,
                iconActiveColor: Colors.white,
                iconColor: Colors.black38,
                textColor: Colors.white,
                text: translations.calendar,
              ),
              GButton(
                backgroundColor: Colors.deepPurple,
                icon: activeIndex == 2
                    ? Iconsax.setting_2_bold
                    : Iconsax.setting_2_outline,
                iconActiveColor: Colors.white,
                iconColor: Colors.black38,
                textColor: Colors.white,
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
