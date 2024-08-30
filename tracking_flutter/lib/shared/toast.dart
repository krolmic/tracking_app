import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/theme/layout.dart';

void showToast({
  required BuildContext context,
  required IconData icon,
  required String message,
  bool isError = false,
}) {
  toastification.show(
    context: context,
    title: Text(
      message,
      style: Theme.of(context).textTheme.bodyMedium,
    ),
    autoCloseDuration: const Duration(seconds: 4),
    alignment: const Alignment(0.5, 0.7),
    icon: Icon(
      icon,
    ),
    margin: const EdgeInsets.only(
      left: viewPaddingHorizontal,
      right: viewPaddingHorizontal,
    ),
    primaryColor:
        isError ? AppColors.toastErrorColor : AppColors.toastSuccessColor,
    closeButtonShowType: CloseButtonShowType.none,
    boxShadow: [
      BoxShadow(
        color: AppColors.contentShadowColor,
        blurRadius: 10,
      ),
    ],
  );
}
