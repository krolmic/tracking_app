part of '../theme.dart';

const _sliderTheme = SliderThemeData(
  trackHeight: 1.5,
  activeTickMarkColor: AppColors.contentOnDarkBackgroundColor,
  inactiveTickMarkColor: AppColors.blue,
  activeTrackColor: AppColors.primarySwatch,
  inactiveTrackColor: AppColors.blue,
  thumbColor: AppColors.primarySwatch,
  thumbShape: RoundSliderThumbShape(
    enabledThumbRadius: 7,
  ),
  valueIndicatorColor: AppColors.primarySwatch,
  valueIndicatorShape: RectangularSliderValueIndicatorShape(),
  valueIndicatorTextStyle: TextStyle(
    color: AppColors.contentOnDarkBackgroundColor,
  ),
);
