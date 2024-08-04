import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/shared/theme/animation.dart';
import 'package:tracking_app/shared/theme/colors.dart';

void showToast(
  BuildContext context,
  IconData icon,
  String message,
) {
  DelightToastBar(
    animationDuration: animationDuration,
    builder: (context) => ToastCard(
      color: contentBackgroundColor,
      leading: Icon(icon),
      title: Text(message),
    ),
    autoDismiss: true,
  ).show(context);
}
