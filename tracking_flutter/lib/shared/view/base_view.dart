import 'package:flutter/material.dart';
import 'package:tracking_app/shared/theme/layout.dart';

class BaseView extends StatelessWidget {
  const BaseView({
    required this.child,
    this.addHorizontalPadding = true,
    this.addVerticalPadding = false,
    super.key,
  });

  final Widget child;
  final bool addVerticalPadding;
  final bool addHorizontalPadding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: addHorizontalPadding ? viewPaddingHorizontal : 0,
          vertical: addVerticalPadding ? viewPaddingVertical : 0,
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: maxViewWidth,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
