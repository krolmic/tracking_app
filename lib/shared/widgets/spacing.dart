import 'package:flutter/material.dart';
import 'package:tracking_app/shared/theme/layout.dart';

enum VerticalSpacingSize { small, medium, large }

class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({
    required this.size,
    super.key,
  });

  const VerticalSpacing.small({super.key}) : size = VerticalSpacingSize.small;
  const VerticalSpacing.medium({super.key}) : size = VerticalSpacingSize.medium;
  const VerticalSpacing.large({super.key}) : size = VerticalSpacingSize.large;

  final VerticalSpacingSize size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _getHeight,
    );
  }

  double get _getHeight {
    switch (size) {
      case VerticalSpacingSize.small:
        return verticalPaddingSmall;
      case VerticalSpacingSize.medium:
        return verticalPaddingMedium;
      case VerticalSpacingSize.large:
        return verticalPaddingLarge;
    }
  }
}
