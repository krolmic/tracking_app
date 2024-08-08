part of '../theme.dart';

final _checkBoxTheme = CheckboxThemeData(
  fillColor: WidgetStateProperty.all(AppColors.inputFillColor),
  checkColor: WidgetStateProperty.all(AppColors.primarySwatch),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
  ),
  side: const BorderSide(
    color: Colors.transparent,
  ),
);
