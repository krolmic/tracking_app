import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/shared/theme/colors.dart';

class AppDotsIndicator extends StatelessWidget {
  const AppDotsIndicator({
    required this.dotsCount,
    required this.position,
    super.key,
  });

  final int dotsCount;
  final double position;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: position,
      decorator: const DotsDecorator(
        activeColor: AppColors.grey,
        color: AppColors.lightGrey,
        activeSize: Size.square(8),
        size: Size.square(8),
      ),
    );
  }
}
