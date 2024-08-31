import 'dart:io';

import 'package:flutter/material.dart';

class PlatformWidget extends StatelessWidget {
  const PlatformWidget({
    required this.iOSWidget,
    required this.androidWidget,
    super.key,
  });

  final Widget iOSWidget;
  final Widget androidWidget;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return androidWidget;
    } else if (Platform.isIOS) {
      return iOSWidget;
    } else {
      throw UnimplementedError('Platform not supported');
    }
  }
}
