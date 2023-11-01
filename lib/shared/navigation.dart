import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     context.go('/home/create');
      //   },
      //   child: const Icon(Icons.add),
      //   shape: const CircleBorder(

      //       // borderRadius: BorderRadius.all(
      //       //   Radius.circular(10),
      //       // ),
      //       ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [
          Icons.home,
          Icons.settings,
        ],
        activeIndex: navigationShell.currentIndex,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: _goBranch,
        activeColor: Colors.blue,
        inactiveColor: Colors.black87,
        iconSize: 25,
        //other params
      ),
      // bottomNavigationBar: NavigationBar(
      //   elevation: 20,
      //   selectedIndex: navigationShell.currentIndex,
      //   destinations: const [
      //     NavigationDestination(label: 'Home', icon: Icon(Icons.home)),
      //     NavigationDestination(label: 'Settings', icon: Icon(Icons.settings)),
      //   ],
      //   onDestinationSelected: _goBranch,
      //   indicatorColor: primarySwatch,
      // ),
    );
  }
}
