import 'package:flutter/material.dart';
import 'package:tracking_app/shared/theme/layout.dart';

enum VerticalSpacingSize {
  extraSmall,
  small,
  medium,
  large,
  extraLarge,
  extraExtraLarge
}

class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({
    required this.size,
    super.key,
  });

  const VerticalSpacing.extraSmall({super.key})
      : size = VerticalSpacingSize.extraSmall;
  const VerticalSpacing.small({super.key}) : size = VerticalSpacingSize.small;
  const VerticalSpacing.medium({super.key}) : size = VerticalSpacingSize.medium;
  const VerticalSpacing.large({super.key}) : size = VerticalSpacingSize.large;
  const VerticalSpacing.extraLarge({super.key})
      : size = VerticalSpacingSize.extraLarge;
  const VerticalSpacing.extraExtraLarge({super.key})
      : size = VerticalSpacingSize.extraExtraLarge;

  final VerticalSpacingSize size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _getHeight,
    );
  }

  double get _getHeight {
    switch (size) {
      case VerticalSpacingSize.extraSmall:
        return verticalPaddingExtraSmall;
      case VerticalSpacingSize.small:
        return verticalPaddingSmall;
      case VerticalSpacingSize.medium:
        return verticalPaddingMedium;
      case VerticalSpacingSize.large:
        return verticalPaddingLarge;
      case VerticalSpacingSize.extraLarge:
        return verticalPaddingExtraLarge;
      case VerticalSpacingSize.extraExtraLarge:
        return verticalPaddingExtraExtraLarge;
    }
  }
}

enum HorizontalSpacingSize { small, medium, large, extraLarge }

class HorizontalSpacing extends StatelessWidget {
  const HorizontalSpacing({
    required this.size,
    super.key,
  });

  const HorizontalSpacing.small({super.key})
      : size = HorizontalSpacingSize.small;
  const HorizontalSpacing.medium({super.key})
      : size = HorizontalSpacingSize.medium;
  const HorizontalSpacing.large({super.key})
      : size = HorizontalSpacingSize.large;
  const HorizontalSpacing.extraLarge({super.key})
      : size = HorizontalSpacingSize.extraLarge;

  final HorizontalSpacingSize size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _getWidth,
    );
  }

  double get _getWidth {
    switch (size) {
      case HorizontalSpacingSize.small:
        return horizontalPaddingSmall;
      case HorizontalSpacingSize.medium:
        return horizontalPaddingMedium;
      case HorizontalSpacingSize.large:
        return horizontalPaddingLarge;
      case HorizontalSpacingSize.extraLarge:
        return horizontalPaddingExtraLarge;
    }
  }
}
