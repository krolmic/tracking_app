import 'package:flutter/material.dart';
import 'package:tracking_app/shared/constants/layout.dart';

class BaseView extends StatelessWidget {
  const BaseView({
    required this.child,
    this.addVerticalPadding = false,
    super.key,
  });

  final Widget child;
  final bool addVerticalPadding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: viewPaddingHorizontal,
          vertical: addVerticalPadding ? viewPaddingVertical : 0,
        ),
        child: child,
      ),
    );
  }
}
