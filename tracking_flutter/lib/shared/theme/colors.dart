import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

const MaterialColor primarySwatch = MaterialColor(
  0xFF78C4C4,
  {
    50: Color.fromRGBO(0, 0, 128, .1),
    100: Color.fromRGBO(0, 0, 128, .2),
    200: Color.fromRGBO(0, 0, 128, .3),
    300: Color.fromRGBO(0, 0, 128, .4),
    400: Color.fromRGBO(0, 0, 128, .5),
    500: Color.fromRGBO(0, 0, 128, .6),
    600: Color.fromRGBO(0, 0, 128, .7),
    700: Color.fromRGBO(0, 0, 128, .8),
    800: Color.fromRGBO(0, 0, 128, .9),
    900: Color.fromRGBO(0, 0, 128, 1),
  },
);

const Color backgroundColor = Color.fromARGB(255, 247, 252, 249);

const Color contentBackgroundColor = Colors.white;

const Color lightBlue = Color(0xFFC9F4E1);
const Color blue = Color(0xFF78C4C4);
const Color darkBlue = Color(0xFF5592A0);
Color lightBlueAccent = lightBlue.withOpacity(0.5);
Color darkBlueAccent = darkBlue.withOpacity(0.5);
const Color grey = Colors.black54;
const Color lightGrey = Colors.black26;

const Color gradientColor1 = Color(0xFFFFFBD7);
const Color gradientColor2 = lightBlue;
const Color gradientColor3 = blue;
const Color gradientColor4 = darkBlue;

const Color bodySmallTextColor = darkBlue;
const Color contentOnDarkBackgroundColor = Colors.white;
Color contentShadowColor = Colors.black.withOpacity(0.2);

const Color buttonsGradientColor1 = gradientColor3;
const Color buttonsGradientColor2 = gradientColor4;
const Color buttonsShadowColor = gradientColor3;

Color inputFillColor = blue.withOpacity(0.2);

Color tileIconColor = darkBlue.withOpacity(.5);
const Color tileSubtitleColor = darkBlue;

const Color dotsIndicatorActiveColor = grey;
const Color dotsIndicatorColor = lightGrey;
const DotsDecorator dotsDecorator = DotsDecorator(
  activeColor: dotsIndicatorActiveColor,
  color: dotsIndicatorColor,
  activeSize: Size.square(8),
  size: Size.square(8),
);
