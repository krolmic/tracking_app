import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:toastification/toastification.dart';
import 'package:tracking_app/shared/theme/colors.dart';
import 'package:tracking_app/shared/theme/layout.dart';

const _toastMargin = EdgeInsets.only(
  left: viewPaddingHorizontal,
  right: viewPaddingHorizontal,
);

List<BoxShadow> _toastShadow = [
  BoxShadow(
    color: AppColors.contentShadowColor,
    blurRadius: 10,
  ),
];

ToastificationItem showToast({
  required BuildContext context,
  required String message,
  bool isError = false,
  bool showProgressBar = true,
  Duration? autoCloseDuration = const Duration(seconds: 4),
  Alignment alignment = const Alignment(0.5, 0.7),
  CloseButtonShowType closeButtonShowType = CloseButtonShowType.none,
  Icon? icon,
}) {
  return toastification.show(
    context: context,
    title: Text(
      message,
      style: Theme.of(context).textTheme.bodyMedium,
    ),
    autoCloseDuration: autoCloseDuration,
    alignment: alignment,
    icon: icon ??
        Icon(
          isError ? Iconsax.info_circle_bold : Iconsax.tick_circle_bold,
        ),
    margin: _toastMargin,
    primaryColor:
        isError ? AppColors.toastErrorColor : AppColors.toastSuccessColor,
    closeButtonShowType: closeButtonShowType,
    boxShadow: _toastShadow,
    showProgressBar: showProgressBar,
  );
}
