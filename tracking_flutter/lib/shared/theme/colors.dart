import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const int blueValue = 0xFF78C4C4;
  static const MaterialColor primarySwatch = MaterialColor(
    blueValue,
    {
      50: blue,
      100: blue,
      200: blue,
      300: blue,
      400: blue,
      500: blue,
      600: blue,
      700: blue,
      800: blue,
      900: blue,
    },
  );

  static const Color blue = Color(blueValue);
  static const Color lightBlue = Color(0xFFC9F4E1);
  static Color lightBlueAccent = lightBlue.withOpacity(0.5);
  static const Color darkBlue = Color(0xFF5592A0);
  static Color darkBlueAccent = darkBlue.withOpacity(0.5);
  static const Color grey = Colors.black54;
  static const Color lightGrey = Colors.black26;

  static const Color backgroundColor = Color.fromARGB(255, 247, 252, 249);
  static const Color contentBackgroundColor = Colors.white;
  static const Color contentOnDarkBackgroundColor = Colors.white;
  static Color contentShadowColor = Colors.black.withOpacity(0.1);

  static const Color gradientColor1 = Color(0xFFFFFBD7);
  static const Color gradientColor2 = lightBlue;
  static const Color gradientColor3 = blue;
  static const Color gradientColor4 = darkBlue;

  static Color inputFillColor = blue.withOpacity(0.2);

  static Color tileIconColor = darkBlue.withOpacity(.5);
  static const Color tileSubtitleColor = darkBlue;

  static const Color toastSuccessColor = blue;
  static const Color toastErrorColor = lightGrey;
}
