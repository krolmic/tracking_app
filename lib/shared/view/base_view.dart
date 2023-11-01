import 'package:flutter/material.dart';
import 'package:tracking_app/shared/constants/layout.dart';

class BaseView extends StatelessWidget {
  const BaseView({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          viewPaddingHorizontal,
          viewPaddingTop,
          viewPaddingHorizontal,
          viewPaddingBottom,
        ),
        child: child,
      ),
    );
  }
}
