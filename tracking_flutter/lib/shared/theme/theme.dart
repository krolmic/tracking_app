import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracking_app/shared/theme/colors.dart';

part 'themes/buttons.dart';
part 'themes/check_box.dart';
part 'themes/input_decoration.dart';
part 'themes/slider.dart';
part 'themes/text.dart';

final theme = ThemeData.from(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: AppColors.primarySwatch,
    backgroundColor: AppColors.backgroundColor,
  ).copyWith(
    surface: AppColors.backgroundColor,
  ),
  textTheme: _textTheme,
).copyWith(
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColors.primarySwatch,
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    iconTheme: IconThemeData(
      color: AppColors.primarySwatch,
      size: 18,
    ),
  ),
  dividerTheme: const DividerThemeData(
    color: AppColors.lightGrey,
    space: 1,
    thickness: 1,
  ),
  inputDecorationTheme: _inputDecorationTheme,
  checkboxTheme: _checkBoxTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: _elevatedButtonStyle,
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: _filledButtonStyle,
  ),
  sliderTheme: _sliderTheme,
);
