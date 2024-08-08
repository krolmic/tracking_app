part of '../theme.dart';

final _inputDecorationTheme = InputDecorationTheme(
  suffixIconColor: AppColors.primarySwatch,
  filled: true,
  fillColor: AppColors.inputFillColor,
  labelStyle: const TextStyle(
    color: AppColors.darkBlue,
    fontSize: 14,
  ),
  hintStyle: TextStyle(
    color: AppColors.darkBlue.withOpacity(0.5),
    fontSize: 14,
  ),
  helperStyle: const TextStyle(
    color: AppColors.darkBlue,
    fontSize: 11,
  ),
  errorStyle: const TextStyle(
    color: AppColors.darkBlue,
    fontSize: 11,
  ),
  border: const OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  contentPadding: const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 12,
  ),
  floatingLabelBehavior: FloatingLabelBehavior.never,
  hoverColor: AppColors.primarySwatch,
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  focusColor: AppColors.primarySwatch,
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);
